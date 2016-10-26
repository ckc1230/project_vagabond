class City < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged
	has_many :posts
end
