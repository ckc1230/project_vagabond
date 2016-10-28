class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:validate_user]

	def show
		@user = User.friendly.find(params[:id])
		@posts = @user.posts.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
    @posted_cities = @user.cities_posted_to
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

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :current_city, :email, :profile_image, :password, :photo)
	end

end
