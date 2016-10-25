class UsersController < ApplicationController
 
	def show
		@user = current_user
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

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :current_city, :email, :profile_image, :password, :photo)
	end

end
