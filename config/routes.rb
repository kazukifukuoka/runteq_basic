Rails.application.routes.draw do
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root to: 'static_pages#top'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, shallow: true
    get 'bookmarks', on: :collection
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    post 'logout', to: 'user_sessions#destroy'
    get 'starter', to: 'dashboards#index', as: :root
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
