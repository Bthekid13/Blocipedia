Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users

  resources :topics do
    resources :wikis, except: [:index]
  end

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

end
