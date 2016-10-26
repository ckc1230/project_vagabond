class UsersController < ApplicationController
 
	def show
		@user = User.friendly.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id

		respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
		# redirect_to user_path(@user)
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
