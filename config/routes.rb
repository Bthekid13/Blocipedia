Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users


  resources :wikis


  resources :wikis, only: [] do
    resources :collaborators, only: [:create, :destroy]
  end



  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

end
