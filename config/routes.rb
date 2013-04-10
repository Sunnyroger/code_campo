CodeCampo::Application.routes.draw do
  
  resources :users
  get "users/new"
  root :to => 'users#new'

end
