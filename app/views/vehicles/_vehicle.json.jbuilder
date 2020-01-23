json.extract! vehicle, :id, :agency_id, :latitude, :longitude, :code, :bus_route_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
