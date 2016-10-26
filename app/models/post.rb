class Post < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :cities, optional: true
  validates :title, :post_text, :city_id, :user_id, presence: true
  validates_length_of :post_text, :minumum => 1, :maximum => 200
end
