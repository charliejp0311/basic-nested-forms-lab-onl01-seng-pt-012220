class RecipesController < ApplicationController
  def show
    @recipe = set_recipe
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  private
  def set_recipe
    Recipe.find(params[:id])
  end
  
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end

end
