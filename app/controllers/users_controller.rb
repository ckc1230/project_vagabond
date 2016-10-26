class UsersController < ApplicationController
 
	def show
		@user = User.friendly.find(params[:id])
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
			flash[:error] = @user.errors.full_messages
			redirect_to root_path
		end
	end
	
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
