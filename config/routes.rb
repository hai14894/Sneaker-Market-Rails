Rails.application.routes.draw do
  resources :listings
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/payments/success", to: "payments#success" #add route for payment success page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
