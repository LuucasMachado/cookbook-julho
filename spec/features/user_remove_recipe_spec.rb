require 'rails_helper'

feature 'User remove recipe' do 
  scenario 'successfully'do
  recipe_type = RecipeType.create(name: 'Entrada')
  cuisine = Cuisine.create(name: 'Brasileira')
  recipe = Recipe.create(title: 'Bolodecenoura', difficulty: 'Médio',
                recipe_type: recipe_type, cuisine: cuisine,
                cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

  visit root_path
  click_on recipe.title
  click_on 'Remover'
  expect(current_path).to eq root_path
  expect(page).not_to have_content(recipe.title)
  end

  scenario 'erasing only one recipe' do
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', difficulty: 'Médio',
                  recipe_type: recipe_type, cuisine: cuisine,
                  cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
                  cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe = Recipe.create(title: 'Bolo de banana', difficulty: 'Médio',
      recipe_type: recipe_type, cuisine: cuisine,
      cook_time: 50, ingredients: 'Farinha, açucar, cenoura',
      cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    visit root_path

    click_on 'Bolo de cenoura'
    click_on 'Remover'

    expect(current_path).to eq root_path
    expect(page).not_to have_content('Bolo de cenoura')
    expect(page).to have_content('Bolo de banana')

  end
end