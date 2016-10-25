class Post < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :cities, optional: true
end
