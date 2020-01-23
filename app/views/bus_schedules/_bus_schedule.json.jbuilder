json.extract! bus_schedule, :id, :day, :bus_stop_id, :time, :bus_route_id, :created_at, :updated_at
json.url bus_schedule_url(bus_schedule, format: :json)
