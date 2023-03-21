Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  resources :profiles, only: [:new, :create, :show]
  resources :reports, only: [:index]
  get 'reports/external', to: 'reports#external'
end
