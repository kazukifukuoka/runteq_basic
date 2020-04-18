Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, shallow: true
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
