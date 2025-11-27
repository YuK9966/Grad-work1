Rails.application.routes.draw do
  get "nail_stocks/index"
  get "nail_stocks/create"
  get "nail_stocks/destroy"
  get "nail_items/new"
  devise_for :users,
    controllers: { sessions: "users/sessions", registrations: "users/registrations" },
    path_names: { sign_in: "login", sign_out: "logout", sign_up: "signup" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :naillogs
  resources :nail_items do
    get :brands_search, on: :collection
    get :products_search, on: :collection
    get :prod_colors_search, on: :collection
    collection do
      get :nail_stocks # nail_items/nail_stocksへのルーティング(nail_itemsのディレクトリからnail_stocksのアクションを加えることができる)
    end
  end
  resources :nail_stocks, only: [ :create, :destroy ] # nail_stocksのcreate,destroyアクションのみルーティング

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#index"
end
