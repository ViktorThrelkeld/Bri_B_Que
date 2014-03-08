class HomeController < ApplicationController
  def home
    num = Recipe.first(:offset => rand(Recipe.count))
    @recipe = Recipe.find(num)
  end
end
