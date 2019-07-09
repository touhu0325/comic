Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'comics#index'
resources :comics do 
  get :jump, on: :collection
  resources :comments, only: [:create]
end
resources :users
post "users/:id/update" => "users#update"
get "users/:id/edit" => "users#edit"
post "users/create" => "users#create"
get "signup" => "users#new"
get "login" => "users#login_form"
post "login" => "users#login"
post "logout" => "users#logout"

end

