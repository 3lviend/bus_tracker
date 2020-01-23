require 'test_helper'

class BusLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_location = bus_locations(:one)
  end

  test "should get index" do
    get bus_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_location_url
    assert_response :success
  end

  test "should create bus_location" do
    assert_difference('BusLocation.count') do
      post bus_locations_url, params: { bus_location: { arrived: @bus_location.arrived, bus_route_id: @bus_location.bus_route_id, bus_stop_id: @bus_location.bus_stop_id, latitude: @bus_location.latitude, longitude: @bus_location.longitude, vehicle_id: @bus_location.vehicle_id } }
    end

    assert_redirected_to bus_location_url(BusLocation.last)
  end

  test "should show bus_location" do
    get bus_location_url(@bus_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_location_url(@bus_location)
    assert_response :success
  end

  test "should update bus_location" do
    patch bus_location_url(@bus_location), params: { bus_location: { arrived: @bus_location.arrived, bus_route_id: @bus_location.bus_route_id, bus_stop_id: @bus_location.bus_stop_id, latitude: @bus_location.latitude, longitude: @bus_location.longitude, vehicle_id: @bus_location.vehicle_id } }
    assert_redirected_to bus_location_url(@bus_location)
  end

  test "should destroy bus_location" do
    assert_difference('BusLocation.count', -1) do
      delete bus_location_url(@bus_location)
    end

    assert_redirected_to bus_locations_url
  end
end
