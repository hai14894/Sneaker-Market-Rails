Rails.application.routes.draw do
  resources :listings
  devise_for :users
  get "/", to: "pages#home", as: "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
