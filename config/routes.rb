Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :likes

      resources :direct_messages

      resources :follows

      resources :posts

      resources :users
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "posts#index"
  resources :likes
  resources :direct_messages
  resources :follows
  resources :posts
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
