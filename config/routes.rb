Rails.application.routes.draw do
  devise_for :users
  resources :quartos
  resources :tipos
  resources :reservas
  resources :hoteis
  resources :hospedes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "sobrenos" => "sites#sobrenos"
  get "quartinho" => "sites#quartinho"
  get "generate", to: "reservas#generate"

  # Defines the root path route ("/")
  root "sites#index"
end
