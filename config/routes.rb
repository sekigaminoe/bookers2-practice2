Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationship, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books, only: [:show, :index, :create, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
