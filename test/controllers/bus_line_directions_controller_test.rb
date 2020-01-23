require 'test_helper'

class BusLineDirectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_line_direction = bus_line_directions(:one)
  end

  test "should get index" do
    get bus_line_directions_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_line_direction_url
    assert_response :success
  end

  test "should create bus_line_direction" do
    assert_difference('BusLineDirection.count') do
      post bus_line_directions_url, params: { bus_line_direction: { bus_route_id: @bus_line_direction.bus_route_id, code: @bus_line_direction.code, direction_name: @bus_line_direction.direction_name, display_name: @bus_line_direction.display_name } }
    end

    assert_redirected_to bus_line_direction_url(BusLineDirection.last)
  end

  test "should show bus_line_direction" do
    get bus_line_direction_url(@bus_line_direction)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_line_direction_url(@bus_line_direction)
    assert_response :success
  end

  test "should update bus_line_direction" do
    patch bus_line_direction_url(@bus_line_direction), params: { bus_line_direction: { bus_route_id: @bus_line_direction.bus_route_id, code: @bus_line_direction.code, direction_name: @bus_line_direction.direction_name, display_name: @bus_line_direction.display_name } }
    assert_redirected_to bus_line_direction_url(@bus_line_direction)
  end

  test "should destroy bus_line_direction" do
    assert_difference('BusLineDirection.count', -1) do
      delete bus_line_direction_url(@bus_line_direction)
    end

    assert_redirected_to bus_line_directions_url
  end
end
