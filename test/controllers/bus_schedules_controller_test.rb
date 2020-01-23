require 'test_helper'

class BusSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bus_schedule = bus_schedules(:one)
  end

  test "should get index" do
    get bus_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_bus_schedule_url
    assert_response :success
  end

  test "should create bus_schedule" do
    assert_difference('BusSchedule.count') do
      post bus_schedules_url, params: { bus_schedule: { bus_route_id: @bus_schedule.bus_route_id, bus_stop_id: @bus_schedule.bus_stop_id, day: @bus_schedule.day, time: @bus_schedule.time } }
    end

    assert_redirected_to bus_schedule_url(BusSchedule.last)
  end

  test "should show bus_schedule" do
    get bus_schedule_url(@bus_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_bus_schedule_url(@bus_schedule)
    assert_response :success
  end

  test "should update bus_schedule" do
    patch bus_schedule_url(@bus_schedule), params: { bus_schedule: { bus_route_id: @bus_schedule.bus_route_id, bus_stop_id: @bus_schedule.bus_stop_id, day: @bus_schedule.day, time: @bus_schedule.time } }
    assert_redirected_to bus_schedule_url(@bus_schedule)
  end

  test "should destroy bus_schedule" do
    assert_difference('BusSchedule.count', -1) do
      delete bus_schedule_url(@bus_schedule)
    end

    assert_redirected_to bus_schedules_url
  end
end
