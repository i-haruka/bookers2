Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  get 'home/about', to: 'homes#about', as: :about

  resources :books, only: [:new, :index, :edit, :show, :create, :destroy, :update]
  resources :users, only: [:edit, :show, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
