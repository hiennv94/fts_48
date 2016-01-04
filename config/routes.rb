Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "static_pages/about"

  resources :users do
    resources :questions
  end
  namespace :admin do
    resources :users
  end
end
