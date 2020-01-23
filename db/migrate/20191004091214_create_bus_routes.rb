class CreateBusRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_routes do |t|
      t.references :agency, foreign_key: true
      t.string :code
      t.string :display_name

      t.timestamps
    end
  end
end
