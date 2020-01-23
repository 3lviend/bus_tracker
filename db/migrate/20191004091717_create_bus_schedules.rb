class CreateBusSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :bus_schedules do |t|
      t.references :bus_stop, foreign_key: true
      t.references :bus_route, foreign_key: true
      t.string :day
      t.datetime :time

      t.timestamps
    end
  end
end
