class Position < ApplicationRecord
  def self.request_current_location
    url = URI("https://api.metro.net/agencies/lametro/routes/30/vehicles/")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"

    response = https.request(request)
    body = JSON.parse(response.read_body)
    
    body['items'].each do |param|
      position = Position.new
      position.latitude   = param['latitude']
      position.longitude  = param['longitude']
      position.vehicle_id = param['id']
      position.run_id     = param['run_id']


      if position.save
        puts position.attributes
        puts 'SUCCESS'
      else
        puts position.errors
        puts 'FAILED'
      end
    end

    body
  end
end
