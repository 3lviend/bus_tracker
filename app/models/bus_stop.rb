class BusStop < ApplicationRecord
  belongs_to :bus_route

  has_many :bus_locations
end
