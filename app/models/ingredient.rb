class Ingredient < ActiveRecord::Base
has_many :recipeingredients
has_many :recipes, :through => :recipeingredients


  # def self.search(search)
  #   ingredients = Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{search}%"]))
  #   ingredients.collect{|i| recipe.recipeingredient.ingredient}
  # end
  def self.search(search)
    @ingredients = Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    binding.pry
        # :select => 'recipe.id')
      # recipes.uniq.sort_by { |recipe| recipe}
  end
end
