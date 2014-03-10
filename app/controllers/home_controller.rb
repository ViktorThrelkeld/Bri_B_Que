class HomeController < ApplicationController
  def home
    @recipe = Recipe.offset(rand(Recipe.count)).first
  end
end
