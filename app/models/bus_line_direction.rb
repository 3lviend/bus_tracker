class BusLineDirection < ApplicationRecord
  has_many :bus_location
  belongs_to :bus_route

  def self.request_runs
    routes = BusRoute.all
    routes.each do |route|
      url = URI("https://api.metro.net/agencies/lametro/routes/30/runs/")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"

      response = https.request(request)
      body = JSON.parse(response.read_body)

      body['items'].each do |param|
        run = BusLineDirection.new
        run.display_name   = param["display_name"]
        run.bus_route      = route
        run.direction_name = param["direction_name"]
        run.code           = param["id"]

        if run.save
          puts run.attributes
          puts 'SUCCESS'
        else
          puts run.errors
          puts 'FAILED'
        end
      end

      body
    end
  end
end
