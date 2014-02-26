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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(recipe_params)
    if recipe.save
      redirect_to recipe_path(recipe)
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:alert] = "Your recipe has been deleted"
    redirect_to :back
  end


private
  def recipe_params
    params.require(:recipe).permit(:title, :prep_time, :instructions)
  end
end