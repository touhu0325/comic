Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'comics#index'

resources :comics do 
  get :jump, on: :collection
  resources :reviews, only: [:create]
end
resources :users
end

