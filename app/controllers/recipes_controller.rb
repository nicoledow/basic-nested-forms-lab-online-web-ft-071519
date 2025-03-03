class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    #binding.pry
    @new_recipe = Recipe.new(recipe_params)

    if @new_recipe.save
      redirect_to recipe_path(@new_recipe)
    else
      render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      :ingredients_attributes => [
        :name,
        :quantity
      ]
    )
  end

end
