Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users,only: [:index, :show, :edit]

  get "/homes/about" => "homes#about", as: "about"

end
