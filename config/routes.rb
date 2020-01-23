Rails.application.routes.draw do
  resources :bus_line_directions
  resources :bus_locations
  resources :bus_schedules
  resources :bus_stops
  resources :vehicles
  resources :bus_routes
  resources :agencies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'bus_locations#index'
end
