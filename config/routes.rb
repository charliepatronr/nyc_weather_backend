Rails.application.routes.draw do
  resources :cities
  
  # get  '/weather/:id', to: 'cities#weather'
  post '/marker', to: 'cities#marker'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
