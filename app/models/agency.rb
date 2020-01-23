class Agency < ApplicationRecord
  has_many :bus_routes
  has_many :vehicles

  TRACKED_AGENCY = ['lametro']

  def self.request_agencies
    url = URI("https://api.metro.net/agencies/")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"

    response = https.request(request)
    body = JSON.parse(response.read_body)

    body.each do |param|
      next unless Agency::TRACKED_AGENCY.include?(param["id"])

      agency = Agency.new
      agency.code           = param["id"]
      agency.display_name   = param["display_name"]

      if agency.save
        puts agency.attributes
        puts 'SUCCESS'
      else
        puts agency.errors
        puts 'FAILED'
      end
    end

    body
  end
end
