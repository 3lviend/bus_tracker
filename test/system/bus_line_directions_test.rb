require "application_system_test_case"

class BusLineDirectionsTest < ApplicationSystemTestCase
  setup do
    @bus_line_direction = bus_line_directions(:one)
  end

  test "visiting the index" do
    visit bus_line_directions_url
    assert_selector "h1", text: "Bus Line Directions"
  end

  test "creating a Bus line direction" do
    visit bus_line_directions_url
    click_on "New Bus Line Direction"

    fill_in "Bus route", with: @bus_line_direction.bus_route_id
    fill_in "Code", with: @bus_line_direction.code
    fill_in "Direction name", with: @bus_line_direction.direction_name
    fill_in "Display name", with: @bus_line_direction.display_name
    click_on "Create Bus line direction"

    assert_text "Bus line direction was successfully created"
    click_on "Back"
  end

  test "updating a Bus line direction" do
    visit bus_line_directions_url
    click_on "Edit", match: :first

    fill_in "Bus route", with: @bus_line_direction.bus_route_id
    fill_in "Code", with: @bus_line_direction.code
    fill_in "Direction name", with: @bus_line_direction.direction_name
    fill_in "Display name", with: @bus_line_direction.display_name
    click_on "Update Bus line direction"

    assert_text "Bus line direction was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus line direction" do
    visit bus_line_directions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus line direction was successfully destroyed"
  end
end
