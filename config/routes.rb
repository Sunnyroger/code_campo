CodeCampo::Application.routes.draw do
  
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]

  root :to => 'users#index'

  match '/signup', to: 'users#new'
  match '/signin', to: 'user_sessions#new'
  match '/signout', to: 'user_sessions#destroy', via: :delete  

end
