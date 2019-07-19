class RecipeTypesController < ActionController::Base
  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))
    if @recipe_type.save
      redirect_to @recipe_type
    else 
      flash[:alert] = "Você deve informar todos os dados da receita"
      render :new
    end
  end

  def show
    @recipe_types = RecipeType.all
  end

end
