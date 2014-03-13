class RecipesController < ApplicationController

  def index
    @recipes = Recipe.sort_by_title.search(params[:search].titleize)
  end

  def new
    @recipe = Recipe.new
    @recipe.recipeingredients.build
    @recipe.recipeingredients.last.build_ingredient
    @recipeingredient = Recipeingredient.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    prepare_recipe
    if @recipe.save
      flash[:notice] = "Your recipe has been posted"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Your fields can't be blank."
      render :action => 'new'
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

    redirect_to  profile_path(current_user.profile)
  end

  def random
    redirect_to Recipe.random
    # @recipe = Recipe.offset(rand(Recipe.count)).first
  end

private
  def prepare_recipe

  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :prep_time,
      :cook_time,
      :instructions,
      :description,
      :servings,
      :recipeingredients_attributes => [
        :id,
        :quantity,
        :ingredient_id,
        :_destroy,
        :ingredient_attributes =>[
          :id,
          :name,
          :_destroy
        ]])
  end
end