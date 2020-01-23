class Vehicle < ApplicationRecord
  belongs_to :agency
  belongs_to :bus_route

  has_many :bus_locations

  def self.request_vehicles
    agencies = Agency.all
    agencies.each do |agency|
      url = URI("https://api.metro.net/agencies/lametro/vehicles/")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"

      response = https.request(request)
      body = JSON.parse(response.read_body)

      body['items'].each do |param|
        next unless BusRoute::TRACKED_ROUTE.include?(param['route_id'])
        route = BusRoute.find_by(code: param['route_id'])

        vehicle = Vehicle.new
        vehicle.agency    = agency
        vehicle.bus_route = route
        vehicle.code      = param["id"]
        vehicle.latitude  = param['latitude']
        vehicle.longitude = param['longitude']

        if vehicle.save
          puts vehicle.attributes
          puts 'SUCCESS'
        else
          puts vehicle.errors
          puts 'FAILED'
        end
      end

      body
    end
  end
end
