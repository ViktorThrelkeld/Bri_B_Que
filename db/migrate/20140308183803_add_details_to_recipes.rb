class AddDetailsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :string
    add_column :recipes, :cook_time, :string
    add_column :recipes, :servings, :string
  end
end
