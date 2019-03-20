Rails.application.routes.draw do
  root to: 'home#index'
  resources :lawyers
  resources :companies
  devise_for :users
end
