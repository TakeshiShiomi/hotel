Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get 'home/top'
  get 'users/show'
  devise_for :users
  resources :users
  resources :reservations
  resources :rooms do
    get :search, on: :collection
  end
  resources :reservations do
    post :confirm, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
