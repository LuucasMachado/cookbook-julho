class RecipesController < ApplicationController
  before_action :find_params, only: [:update, :edit, :show]
  before_action :recipe_type_all, only: [:edit, :new]
  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else 
      flash[:alert] = "Você deve informar todos os dados da receita"
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:alert] = "Você deve informar todos os dados da receita"
      render :edit
    end
  end

  def edit
  end

  def show
  end

  private

  def recipe_type_all
    @recipe_type = RecipeType.all
  end

  def find_params
    @recipe = Recipe.find(params[:id])
  end
    
  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
