Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users
  resources :user_sessions

  get 'login', to: 'user_sessions#new', as: :login
  post 'logout', to: 'user_sessions#destroy', as: :logout
end
