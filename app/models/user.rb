class User < ApplicationRecord
	extend FriendlyId
  friendly_id :generate_custom_slug, use: :slugged
	has_many :posts
	has_secure_password
	has_attached_file :photo, :styles => { :small => "255x255#"}, :default_url => "Trekkster_Default.jpg"
	validates_attachment :photo,
  			content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
	validates :email, uniqueness: true
	validates :email, :first_name, :last_name, :current_city, presence: true

	def self.confirm (email, password)
		user = User.find_by(email: email)
		user.authenticate(password)
	end

	def generate_custom_slug
    "#{first_name}_#{last_name}"
  end

  # cities user has posted to
  def cities_posted_to
    self.posts.map(&:city).uniq
  end

end
