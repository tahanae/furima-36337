Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items, only:[:index, :create, :new, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
