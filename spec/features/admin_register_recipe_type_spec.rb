require 'rails_helper'

feature 'Admin register recipe_type' do
  scenario 'successfully' do
    user = User.create(email: 'lucas@gmail.com', password: '123456') 

    login_as(user, scope: :user)
    visit root_path
    click_on 'Cadastrar tipo de receita'
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
  end

  scenario 'and must fill in name' do
    user = User.create(email: 'lucas@gmail.com', password: '123456') 

    login_as(user, scope: :user)
    visit root_path
    click_on 'Cadastrar tipo de receita'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end
end
