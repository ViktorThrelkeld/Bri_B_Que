class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end



private
  def recipe_params
    params.require(:recipe).permit(:title)
  end
end