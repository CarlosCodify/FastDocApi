Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :shipments do
        member do
          post :assign_motorcyclist
          post :start_delivery
          post :complete_delivery
          post :register_sender_payment
          post :register_receiver_payment
        end
      end
      resources :documents
      resources :motorcyclists do
        resources :motorcycles, only: %i[index create]
      end
      resources :motorcycles, only: %i[show update destroy]
      resources :customers do
        resources :locations, only: %i[index create]
      end
      resources :locations, only: %i[show update destroy]
    end
  end
end
