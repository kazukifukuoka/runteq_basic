Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, shallow: true
    get 'bookmarks', on: :collection
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
