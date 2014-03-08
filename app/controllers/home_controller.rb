class HomeController < ApplicationController
  def home
    @recipe = Recipe.offset(rand(Recipe.count)).first
    # num = Recipe.first(:offset => rand(Recipe.count))
    # @recipe = Recipe.find(num)
  end
end
