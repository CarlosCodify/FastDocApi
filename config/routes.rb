Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
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
