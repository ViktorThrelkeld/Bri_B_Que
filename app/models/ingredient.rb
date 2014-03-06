class Ingredient < ActiveRecord::Base
has_many :recipeingredients
has_many :recipes, :through => :recipeingredients

  # def self.search(search)
  #   ingredients = Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   ingredients.collect{|i| i.recipe}
  # end
  def self.search(search)
    @ingredients = Ingredient.find(:all, :conditions => ['name LIKE?', "%#{search}%"])

    # :select => [recipe_id])
    # recipes += Ingredient.find(:all, :conditions => ['name LIKE ?', "%#{search}%"])

        # :select => 'recipe.id')
      # recipes.uniq.sort_by { |recipe| recipe}
      # binding.pry
  end
end
