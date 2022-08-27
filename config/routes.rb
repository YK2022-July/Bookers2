Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"
  resources :users
  resources :books

  # post "users/:id" => "books#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
