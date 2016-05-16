Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :charges, only: [:new, :create]

  resources :topics

  resources :wikis


  get 'show' => 'users#show'
  get 'about' => 'welcome#about'
  get 'premium' => 'wikis#premium'
  get 'standard' => 'wikis#standard'


end
