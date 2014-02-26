class CreateRecipeingredients < ActiveRecord::Migration
  def change
    create_table :recipeingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.string :quantity

      t.timestamps
    end
    add_index :recipeingredients, :ingredient_id
    add_index :recipeingredients, :recipe_id
  end
end
