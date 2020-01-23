class CreateBusLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_locations do |t|
      t.references :bus_stop, foreign_key: true
      t.references :bus_route, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.references :bus_line_direction, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.boolean :arrived
      t.string :run_id

      t.timestamps
    end
  end
end
