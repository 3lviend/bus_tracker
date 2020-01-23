# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_04_091839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "code"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_line_directions", force: :cascade do |t|
    t.bigint "bus_route_id"
    t.string "display_name"
    t.string "direction_name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_route_id"], name: "index_bus_line_directions_on_bus_route_id"
  end

  create_table "bus_locations", force: :cascade do |t|
    t.bigint "bus_stop_id"
    t.bigint "bus_route_id"
    t.bigint "vehicle_id"
    t.bigint "bus_line_direction_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "arrived"
    t.string "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_line_direction_id"], name: "index_bus_locations_on_bus_line_direction_id"
    t.index ["bus_route_id"], name: "index_bus_locations_on_bus_route_id"
    t.index ["bus_stop_id"], name: "index_bus_locations_on_bus_stop_id"
    t.index ["vehicle_id"], name: "index_bus_locations_on_vehicle_id"
  end

  create_table "bus_routes", force: :cascade do |t|
    t.bigint "agency_id"
    t.string "code"
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_bus_routes_on_agency_id"
  end

  create_table "bus_schedules", force: :cascade do |t|
    t.bigint "bus_stop_id"
    t.bigint "bus_route_id"
    t.string "day"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_route_id"], name: "index_bus_schedules_on_bus_route_id"
    t.index ["bus_stop_id"], name: "index_bus_schedules_on_bus_stop_id"
  end

  create_table "bus_stops", force: :cascade do |t|
    t.bigint "bus_route_id"
    t.string "display_name"
    t.float "latitude"
    t.float "longitude"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_route_id"], name: "index_bus_stops_on_bus_route_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "agency_id"
    t.bigint "bus_route_id"
    t.float "latitude"
    t.float "longitude"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_vehicles_on_agency_id"
    t.index ["bus_route_id"], name: "index_vehicles_on_bus_route_id"
  end

  add_foreign_key "bus_line_directions", "bus_routes"
  add_foreign_key "bus_locations", "bus_line_directions"
  add_foreign_key "bus_locations", "bus_routes"
  add_foreign_key "bus_locations", "bus_stops"
  add_foreign_key "bus_locations", "vehicles"
  add_foreign_key "bus_routes", "agencies"
  add_foreign_key "bus_schedules", "bus_routes"
  add_foreign_key "bus_schedules", "bus_stops"
  add_foreign_key "bus_stops", "bus_routes"
  add_foreign_key "vehicles", "agencies"
  add_foreign_key "vehicles", "bus_routes"
end
