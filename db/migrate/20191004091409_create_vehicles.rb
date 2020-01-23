class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :agency, foreign_key: true
      t.references :bus_route, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :code

      t.timestamps
    end
  end
end
