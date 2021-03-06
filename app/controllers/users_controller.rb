class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:validate_user]
 
	def show
		@user = User.friendly.find(params[:id])
		@posts = @user.posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
		@posted_cities_id = get_cities_id
		@posted_cities = get_cities(@posted_cities_id)
		@post_count = count_occurences
	end

	def new
		@user = User.new
	end

	def create

		@user = User.new(user_params)
		if @user.valid? 
			@user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to root_path
		end

	end
		# respond_to do |format|
  #     if @user.save
  #       # Tell the UserMailer to send a welcome email after save
  #       UserMailer.welcome_email(@user).deliver_now
 
  #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
  #       format.json { render json: @user, status: :created, location: @user }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end

	
	
	def update
		 user = current_user.update(user_params)
		 redirect_to user_path
	end


	def validate_user
		@user = User.new(user_params)
		if @user.valid?
			render :status => 200, nothing: true
		else
			render :status => 400, nothing: true
		end
	end

	def get_cities_id
		cities_id = [].to_set
		@user.posts.each do |f|
			if f.city_id
				cities_id.add(f.city_id)
			end
		end
		return cities_id
	end
	def get_cities(id_array)
		cities = [].to_set
		id_array.each do |f|
			cities.add(City.find(f))
		end
		return cities
	end

	def count_occurences
		count_occurences = []
		@posted_cities_id.each do |f|
			count_occurences << (Post.all.count(f))
		end
		return count_occurences

	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :current_city, :email, :profile_image, :password, :photo)
	end

end
