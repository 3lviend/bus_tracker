require "application_system_test_case"

class BusLocationsTest < ApplicationSystemTestCase
  setup do
    @bus_location = bus_locations(:one)
  end

  test "visiting the index" do
    visit bus_locations_url
    assert_selector "h1", text: "Bus Locations"
  end

  test "creating a Bus location" do
    visit bus_locations_url
    click_on "New Bus Location"

    check "Arrived" if @bus_location.arrived
    fill_in "Bus route", with: @bus_location.bus_route_id
    fill_in "Bus stop", with: @bus_location.bus_stop_id
    fill_in "Latitude", with: @bus_location.latitude
    fill_in "Longitude", with: @bus_location.longitude
    fill_in "Vehicle", with: @bus_location.vehicle_id
    click_on "Create Bus location"

    assert_text "Bus location was successfully created"
    click_on "Back"
  end

  test "updating a Bus location" do
    visit bus_locations_url
    click_on "Edit", match: :first

    check "Arrived" if @bus_location.arrived
    fill_in "Bus route", with: @bus_location.bus_route_id
    fill_in "Bus stop", with: @bus_location.bus_stop_id
    fill_in "Latitude", with: @bus_location.latitude
    fill_in "Longitude", with: @bus_location.longitude
    fill_in "Vehicle", with: @bus_location.vehicle_id
    click_on "Update Bus location"

    assert_text "Bus location was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus location" do
    visit bus_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus location was successfully destroyed"
  end
end
