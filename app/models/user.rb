class User < ApplicationRecord
	has_many :posts
	has_secure_password
	has_attached_file :photo, :styles => { :small => "200x200#"}
	do_not_validate_attachment_file_type :photo

	def self.confirm (email, password)
		user = User.find_by(email: email)
		user.authenticate(password)
	end
end
