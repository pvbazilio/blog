Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :user do
    resources :posts
  end
end
