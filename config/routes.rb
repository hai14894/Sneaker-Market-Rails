Rails.application.routes.draw do
  resources :listings
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/payments/success", to: "payments#success" #add route for payment success page"
  post "/payments/webhook", to: "payments#webhook" 
end
