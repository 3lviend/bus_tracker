json.extract! bus_stop, :id, :display_name, :latitude, :longitude, :code, :bus_route_id, :created_at, :updated_at
json.url bus_stop_url(bus_stop, format: :json)
