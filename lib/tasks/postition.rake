namespace :postition do
  desc "test"
  task test: :environment do
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts Time.now
    puts "---------1234--------------------------------------"
    puts "\n"
  end

  desc "Get position of bus"
  task get_position: :environment do
    BusLocation.request_current_location
    puts "\n"
  end
end