Rails.application.routes.draw do
  root "users#index"
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :comments, only: %i[new create]
    end
  end

  get 'new', to: 'posts#new'

end
