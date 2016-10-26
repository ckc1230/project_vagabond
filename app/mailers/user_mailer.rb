class UserMailer < ApplicationMailer
	default from: 'trekkster@world.com'

	def welcome_email(user)
    @user = user
    email_with_name = "#{@user.first_name} <#{@user.email}>"
    mail(to: email_with_name, subject: 'Welcome to Trekkster!')
  end

end
