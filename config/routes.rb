Rails.application.routes.draw do
  resources :cities
  post '/marker', to: 'cities#marker'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
