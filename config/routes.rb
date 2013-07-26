HealthTracker::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, :only => [:new, :create]
  resources :users, :only => [:new, :create]

  root to: 'sessions#new'
end
