Rails.application.routes.draw do
  root "users#index"
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :comments, only: %i[new create]
    end
  end

  get 'new', to: 'posts#new'
  put '/post/:id/like', to: 'posts#like', as: 'like'
end
