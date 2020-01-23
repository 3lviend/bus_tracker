class CreateBusLineDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_line_directions do |t|
      t.references :bus_route, foreign_key: true
      t.string :display_name
      t.string :direction_name
      t.string :code

      t.timestamps
    end
  end
end
