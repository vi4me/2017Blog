Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/auth/:provider/callback', to: 'sessions#create'

  devise_for :users
  root 'welcome#index'

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end

  resources :articles do
  resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   namespace :api, defaults: { format: :json } do
    resources :articles
    resources :comments
    resources :users
  end
end
