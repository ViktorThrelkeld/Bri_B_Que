class Ingredient < ActiveRecord::Base
has_many :recipeingredients
has_many :recipes, :through => :recipeingredients

  def self.search(search)
    @ingredients = Ingredient.find(:all, :conditions => ['name LIKE?', "%#{search}%"])
  end
end
