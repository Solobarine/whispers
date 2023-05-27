Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :show, :new] do
      resources :comments, only: [:new, :create], shallow: true
      resources :likes, only: [:create, :destroy], shallow: true
    end
  end
  root "users#index"
end
