require "application_system_test_case"

class BusRoutesTest < ApplicationSystemTestCase
  setup do
    @bus_route = bus_routes(:one)
  end

  test "visiting the index" do
    visit bus_routes_url
    assert_selector "h1", text: "Bus Routes"
  end

  test "creating a Bus route" do
    visit bus_routes_url
    click_on "New Bus Route"

    fill_in "Code", with: @bus_route.code
    fill_in "Display name", with: @bus_route.display_name
    click_on "Create Bus route"

    assert_text "Bus route was successfully created"
    click_on "Back"
  end

  test "updating a Bus route" do
    visit bus_routes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @bus_route.code
    fill_in "Display name", with: @bus_route.display_name
    click_on "Update Bus route"

    assert_text "Bus route was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus route" do
    visit bus_routes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus route was successfully destroyed"
  end
end
