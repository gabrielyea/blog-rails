Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root "users#index"
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create destroy] do
      resources :comments, only: %i[new create destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    post 'login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
    resources :users, only: %i[create show index] do
      resources :posts, only: %i[index show] do
        resources :comments, only: %i[create, index]
      end
    end
  end

  get 'new', to: 'posts#new', as: 'new'
  put '/post/:id/like', to: 'likes#create', as: 'like'

end
