CodeCampo::Application.routes.draw do
  
  resources :users
  resources :topics
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :replies, only: [:new, :create, :edit, :update, :destroy]

  root :to => 'users#index'

  match '/signup', to: 'users#new'
  match '/signin', to: 'user_sessions#new'
  match '/signout', to: 'user_sessions#destroy', via: :delete  
  
end
