require 'test_helper'

class MratingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mrating = mratings(:one)
  end

  test "should get index" do
    get mratings_url
    assert_response :success
  end

  test "should get new" do
    get new_mrating_url
    assert_response :success
  end

  test "should create mrating" do
    assert_difference('Mrating.count') do
      post mratings_url, params: { mrating: { name: @mrating.name } }
    end

    assert_redirected_to mrating_url(Mrating.last)
  end

  test "should show mrating" do
    get mrating_url(@mrating)
    assert_response :success
  end

  test "should get edit" do
    get edit_mrating_url(@mrating)
    assert_response :success
  end

  test "should update mrating" do
    patch mrating_url(@mrating), params: { mrating: { name: @mrating.name } }
    assert_redirected_to mrating_url(@mrating)
  end

  test "should destroy mrating" do
    assert_difference('Mrating.count', -1) do
      delete mrating_url(@mrating)
    end

    assert_redirected_to mratings_url
  end
end
