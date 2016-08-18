Rails.application.routes.draw do



  devise_for :users


  root 'books#index'
  resources :publishers
  resources :books
  resources :categories, only: [:index, :show]
  resources :authors

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
