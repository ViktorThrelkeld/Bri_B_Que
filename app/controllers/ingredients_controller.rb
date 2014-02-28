class IngredientsController < ApplicationController

  def index

  end

  def new
  end

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

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update_attributes(ingredient_params)
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    flash[:alert] = "Your ingredient has been deleted"
    @ingredient.destroy

    redirect_to  new_ingredient_path#profile_path(current_user.profile) #this is your problem, you're trying to redirect back to a show page for an ingredient you just deleted
    # what's up with edit then?
    # edit takes you to the edit view and then the form on your edit view goes to the update action
    #try that
  end


private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
