class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :city, optional: true
  validates :title, :post_text, :city_id, :user_id, presence: true
  validates_length_of :title, :minumum => 1, :maximum => 200
end
