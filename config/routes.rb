Rails.application.routes.draw do

  devise_for :admins
  devise_for :users


  root 'books#index'
  resources :publishers
  resources :books
  resources :categories, only: [:index, :show]
  resources :authors

  resources :books do
    resources :votes, only: [:create, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
