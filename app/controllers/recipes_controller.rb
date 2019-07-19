class RecipesController < ApplicationController
  before_action :set_recipe, only: [:update, :edit, :show, :destroy]
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

  def destroy
    @recipe.delete
    redirect_to root_path
  end

  private

  def recipe_type_all
    @recipe_type = RecipeType.all
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
    
  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method)
  end
end
