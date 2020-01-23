Agency.delete_all
Agency.request_agencies

BusRoute.delete_all
BusRoute.request_routes

Vehicle.delete_all
Vehicle.request_vehicles

bus_stops_thirty = [
  {
    "id" => "18012",
    "latitude" => 34.0473999,
    "longitude" => -118.29143,
    "display_name" => "Pico / Vermont"
  },
  {
    "id" => "12378",
    "latitude" => 34.0638599,
    "longitude" => -118.37097,
    "display_name" => "San Vicente / Wilshire"
  }
]

route = BusRoute.find_by(code: '30')
bus_stops_thirty.each do |param|
  bus_stop = BusStop.new
  bus_stop.display_name = param['display_name']
  bus_stop.latitude     = param['latitude']
  bus_stop.longitude    = param['longitude']
  bus_stop.code         = param['id']
  bus_stop.bus_route    = route

  if bus_stop.save
    puts bus_stop.attributes
    puts 'SUCCESS bus_stop'
  else
    puts bus_stop.errors
    puts 'FAILED bus_stop'
  end
end

BusLineDirection.delete_all
BusLineDirection.request_runs

# distances = BusLocation.all.map do |bl|
#   listing_location = [bl.latitude, bl.longitude]
#   [Geocoder::Calculations.distance_between(from_location, listing_location, units: :km), bl.id]
# end