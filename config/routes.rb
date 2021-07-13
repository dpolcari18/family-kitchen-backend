Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :ingredients
  resources :ingredient_quantities
  resources :steps
  resources :recipes
  resources :families
  resources :user_families
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
