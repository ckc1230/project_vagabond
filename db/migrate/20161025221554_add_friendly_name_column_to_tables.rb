class AddFriendlyNameColumnToTables < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :slug, :string
  	add_column :cities, :slug, :string
  end
end
