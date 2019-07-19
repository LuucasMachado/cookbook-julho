require 'rails_helper'

RSpec.describe RecipeType, type: :model do
  it 'should not be valid' do
    recipe_type = RecipeType.new(name: '').valid?

    expect(recipe_type).to eq false
  end

  it 'should be valid' do
    recipe_type = RecipeType.new(name: 'Sobremesa').valid?

    expect(recipe_type).to eq true
  end

  it 'should be not equal' do
    recipe_type = RecipeType.create(name: 'Sobremesa').valid?
    recipe_type2 = RecipeType.new(name: 'Sobremesa').valid?

    expect(recipe_type2).not_to eq true
  end
end
