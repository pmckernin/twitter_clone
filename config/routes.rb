Rails.application.routes.draw do
  resources :likes
  resources :direct_messages
  resources :follows
  resources :posts
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
