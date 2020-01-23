class CreateBusStops < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_stops do |t|
      t.references :bus_route, foreign_key: true
      t.string :display_name
      t.float :latitude
      t.float :longitude
      t.string :code

      t.timestamps
    end
  end
end
