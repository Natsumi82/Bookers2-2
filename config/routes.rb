Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :users, only: [:index, :show, :edit, :destroy, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]


 get 'home/about'=>'home#about'


end
