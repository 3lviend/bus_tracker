require "application_system_test_case"

class BusSchedulesTest < ApplicationSystemTestCase
  setup do
    @bus_schedule = bus_schedules(:one)
  end

  test "visiting the index" do
    visit bus_schedules_url
    assert_selector "h1", text: "Bus Schedules"
  end

  test "creating a Bus schedule" do
    visit bus_schedules_url
    click_on "New Bus Schedule"

    fill_in "Bus route", with: @bus_schedule.bus_route_id
    fill_in "Bus stop", with: @bus_schedule.bus_stop_id
    fill_in "Day", with: @bus_schedule.day
    fill_in "Time", with: @bus_schedule.time
    click_on "Create Bus schedule"

    assert_text "Bus schedule was successfully created"
    click_on "Back"
  end

  test "updating a Bus schedule" do
    visit bus_schedules_url
    click_on "Edit", match: :first

    fill_in "Bus route", with: @bus_schedule.bus_route_id
    fill_in "Bus stop", with: @bus_schedule.bus_stop_id
    fill_in "Day", with: @bus_schedule.day
    fill_in "Time", with: @bus_schedule.time
    click_on "Update Bus schedule"

    assert_text "Bus schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus schedule" do
    visit bus_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus schedule was successfully destroyed"
  end
end
