class BusLocation < ApplicationRecord
  belongs_to :bus_stop, optional: true
  belongs_to :bus_route
  belongs_to :vehicle
  belongs_to :bus_line_direction, optional: true

  def self.request_current_location
    routes = BusRoute.all
    routes.each do |route|
      url = URI("https://api.metro.net/agencies/#{route.agency.code}/routes/#{route.code}/vehicles/")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"

      response = https.request(request)
      body = JSON.parse(response.read_body)
      
      body['items'].each do |param|
        vehicle = Vehicle.find_by(code: param['id'])
        route   = BusRoute.find_by(code: param['route_id'])
        # line    = BusLineDirection.find_by(code: param['run_id'])

        location = BusLocation.new
        location.latitude   = param['latitude']
        location.longitude  = param['longitude']
        location.run_id     = param['run_id']
        location.vehicle    = vehicle
        location.bus_route  = route
        # location.bus_line_direction = route


        if location.save
          puts location.attributes
          puts 'SUCCESS'
        else
          puts location.errors
          puts 'FAILED'
        end
        puts param
      end

      body
    end
  end

  def self.detect_has_arrived(current_latlong, bus_stop)
    # USING GEOCODER TO DETECT IF LOCATION CLOSEST WITH BUS_STOP
  end

end
