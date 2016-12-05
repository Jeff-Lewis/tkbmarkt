require 'test_helper'

class McalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mcalendar = mcalendars(:one)
  end

  test "should get index" do
    get mcalendars_url
    assert_response :success
  end

  test "should get new" do
    get new_mcalendar_url
    assert_response :success
  end

  test "should create mcalendar" do
    assert_difference('Mcalendar.count') do
      post mcalendars_url, params: { mcalendar: { name: @mcalendar.name } }
    end

    assert_redirected_to mcalendar_url(Mcalendar.last)
  end

  test "should show mcalendar" do
    get mcalendar_url(@mcalendar)
    assert_response :success
  end

  test "should get edit" do
    get edit_mcalendar_url(@mcalendar)
    assert_response :success
  end

  test "should update mcalendar" do
    patch mcalendar_url(@mcalendar), params: { mcalendar: { name: @mcalendar.name } }
    assert_redirected_to mcalendar_url(@mcalendar)
  end

  test "should destroy mcalendar" do
    assert_difference('Mcalendar.count', -1) do
      delete mcalendar_url(@mcalendar)
    end

    assert_redirected_to mcalendars_url
  end
end
