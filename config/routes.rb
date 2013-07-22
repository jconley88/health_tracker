HealthTracker::Application.routes.draw do
  resources :sessions, :only => [:new, :create]

  root to: 'sessions#new'
end
