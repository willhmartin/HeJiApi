Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :show, :create ] do
        resources :trips, only: [ :index, :show, :create, :update, :destroy ]
      end

      resources :activities, only: [ :index, :show, :create, :update, :destroy ]
      resources :guests, only: [ :show, :create ]
      resources :payments, only: [ :index, :create, :update, :destroy ]
      resources :budgets, only: [ :show, :create, :update, :destroy ]
    end
  end
end
