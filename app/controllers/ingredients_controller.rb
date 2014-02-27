class IngredientsController < ApplicationController


  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "Your ingredients have been posted"
      redirect_to ingredient_path(@ingredient)
    else
      flash[:alert] = "Your fields can't be blank."
      render
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end


private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
