AirbnbClone::Application.routes.draw do

  devise_for :users, :listings
  root to: 'listings#index'
    resources :users do
      resources :listings
  end
  resources :listings
end
