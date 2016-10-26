class UsersController < ApplicationController
 
	def show
		@user = User.friendly.find(params[:id])
		@posts = @user.posts.paginate(:page => params[:page], :per_page => 3)
		posted_cities_id = get_cities_id
		@posted_cities = get_cities(posted_cities_id)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end
	
	def update
		 user = current_user.update(user_params)
		 redirect_to user_path
	end

	def get_cities_id
		cities_id = [].to_set
		@user.posts.each do |f|
			cities_id.add(f.city_id)
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

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :current_city, :email, :profile_image, :password, :photo)
	end
end
