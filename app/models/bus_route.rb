class BusRoute < ApplicationRecord
  belongs_to :agency

  has_many :bus_locations
  has_many :bus_line_directions

  TRACKED_ROUTE = ['30']

  def self.request_routes
    agencies = Agency.all
    agencies.each do |agency|
      url = URI("https://api.metro.net/agencies/lametro/routes/")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"

      response = https.request(request)
      body = JSON.parse(response.read_body)

      body['items'].each do |param|
        next unless BusRoute::TRACKED_ROUTE.include?(param["id"])

        route = BusRoute.new
        route.agency       = agency
        route.code         = param["id"]
        route.display_name = param["display_name"]

        if route.save
          puts route.attributes
          puts 'SUCCESS'
        else
          puts route.errors
          puts 'FAILED'
        end
      end

      body
    end
  end
end
