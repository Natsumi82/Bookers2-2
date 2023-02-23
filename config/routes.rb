Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  resouces :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  devise_for :users
root to: "homes#top"
end
