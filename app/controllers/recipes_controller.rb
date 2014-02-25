class RecipesController < ApplicationController

  def new
    # @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Your recipe has been posted"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Your fields can't be blank."
      render
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end



private
  def recipe_params
    params.require(:recipe).permit(:title, :prep_time, :instructions)
  end
end