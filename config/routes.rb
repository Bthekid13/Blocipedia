Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :wikis, only: [] do
    resources :collaborations, only: [:create, :destroy]
  end


  resources :charges, only: [:new, :create]
  get 'show' => 'users#show'
  get 'about' => 'welcome#about'

end
