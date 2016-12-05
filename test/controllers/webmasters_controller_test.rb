require 'test_helper'

class WebmastersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @webmaster = webmasters(:one)
  end

  test "should get index" do
    get webmasters_url
    assert_response :success
  end

  test "should get new" do
    get new_webmaster_url
    assert_response :success
  end

  test "should create webmaster" do
    assert_difference('Webmaster.count') do
      post webmasters_url, params: { webmaster: { name: @webmaster.name } }
    end

    assert_redirected_to webmaster_url(Webmaster.last)
  end

  test "should show webmaster" do
    get webmaster_url(@webmaster)
    assert_response :success
  end

  test "should get edit" do
    get edit_webmaster_url(@webmaster)
    assert_response :success
  end

  test "should update webmaster" do
    patch webmaster_url(@webmaster), params: { webmaster: { name: @webmaster.name } }
    assert_redirected_to webmaster_url(@webmaster)
  end

  test "should destroy webmaster" do
    assert_difference('Webmaster.count', -1) do
      delete webmaster_url(@webmaster)
    end

    assert_redirected_to webmasters_url
  end
end
