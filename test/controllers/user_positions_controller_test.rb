require 'test_helper'

class UserPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_position = user_positions(:one)
  end

  test "should get index" do
    get user_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_position_url
    assert_response :success
  end

  test "should create user_position" do
    assert_difference('UserPosition.count') do
      post user_positions_url, params: { user_position: { name: @user_position.name } }
    end

    assert_redirected_to user_position_url(UserPosition.last)
  end

  test "should show user_position" do
    get user_position_url(@user_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_position_url(@user_position)
    assert_response :success
  end

  test "should update user_position" do
    patch user_position_url(@user_position), params: { user_position: { name: @user_position.name } }
    assert_redirected_to user_position_url(@user_position)
  end

  test "should destroy user_position" do
    assert_difference('UserPosition.count', -1) do
      delete user_position_url(@user_position)
    end

    assert_redirected_to user_positions_url
  end
end
