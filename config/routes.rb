Rails.application.routes.draw do
  default_url_options :host => "localhost:3001"
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index, :update]
  resources :clients
  resources :drivers
  resources :punches
  resources :image_elements, only: [:index, :destroy, :create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
