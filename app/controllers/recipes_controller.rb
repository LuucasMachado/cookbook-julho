class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.create(params.require(:recipe).permit([:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method]))
    redirect_to @recipe
  end

  def new
    @recipe = Recipe.new
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params.require(:recipe).permit([:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method]))
    redirect_to @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
