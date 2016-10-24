class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :users, foreign_key: true
      t.text :post_text
      t.string :city

      t.timestamps
    end
  end
end
