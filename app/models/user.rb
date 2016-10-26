class User < ApplicationRecord
	extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged
	has_many :posts
	has_secure_password
	has_attached_file :photo, :styles => { :small => "200x200#"}, :default_url => "Trekkster_Default.jpg"
	do_not_validate_attachment_file_type :photo

	def self.confirm (email, password)
		user = User.find_by(email: email)
		user.authenticate(password)
	end

	def generate_custom_slug
    "#{first_name}_#{last_name}"
  end
end
