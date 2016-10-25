class AddingCitiesModelToPosts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :posts, :city
  	add_reference :posts, :city, foreign_key: true
  end
end
