Rails.application.routes.draw do
  default_url_options :host => "example.com"

  root to: 'home#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/signup' => 'users#create'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users do
    member do
      get :confirm_email
    end
  end


end
