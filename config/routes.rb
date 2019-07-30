Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :cuisines
  resources :recipes
  resources :recipe_types, only: %i[show new create]
  resources :list
  get 'search', to: "recipes#search"
  get 'profile', to: "users#profile"
end
