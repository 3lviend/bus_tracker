json.extract! bus_location, :id, :bus_stop_id, :bus_route_id, :vehicle_id, :latitude, :longitude, :arrived, :created_at, :updated_at
json.url bus_location_url(bus_location, format: :json)
