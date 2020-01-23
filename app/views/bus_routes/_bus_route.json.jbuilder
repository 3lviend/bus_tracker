json.extract! bus_route, :id, :code, :display_name, :created_at, :updated_at
json.url bus_route_url(bus_route, format: :json)
