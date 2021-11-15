Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :comments, only: %i[new create]
    end
  end

  get 'new', to: 'posts#new', as: 'new'
  put '/post/:id/like', to: 'likes#create', as: 'like'
end
