Rails.application.routes.draw do


  root to: 'welcome#index'

  resources :wikis

  resources :topics

  resources :charges, only: [:new, :create, :destroy]

  devise_for :users

end
