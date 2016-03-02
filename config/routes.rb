Rails.application.routes.draw do


  root to: 'welcome#index'

  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users

end
