Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show] do
        resources :comments, only: [:create, :new]
        resources :likes, only: [:create]
      end
    end
    resources :posts, only: [:create]
    root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
