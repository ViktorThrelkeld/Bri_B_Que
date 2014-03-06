class RecipesController < ApplicationController

  def index
    @recipes = Recipe.search(params[:search])
    # ingredient = Ingredient.where(:name => @recipes)
  end

  # def search
  #   @recipes = Recipe.search params[:search]
  # end

  def new
    @recipe = Recipe.new
    @recipe.recipeingredients.build #initialize recipe -> recipe_ingredients association
    @recipe.recipeingredients.last.build_ingredient #initialize recipe_ingredients -> ingredient association
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
    # @ingredients = Ingredient.find(params[:search])
    # @recipe.attributes = recipe_params

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

  # def search
  # term = params[:search]
  # ingredient = Ingredient.where(:name => term)
  # @recipes = Ingredient.find(ingredient).recipes
  # end


private
  def prepare_recipe

  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :prep_time,
      :instructions,
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