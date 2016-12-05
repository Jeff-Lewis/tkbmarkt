require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index1" do
    get home_index1_url
    assert_response :success
  end

  test "should get index2" do
    get home_index2_url
    assert_response :success
  end

  test "should get index3" do
    get home_index3_url
    assert_response :success
  end

  test "should get index4" do
    get home_index4_url
    assert_response :success
  end

  test "should get index5" do
    get home_index5_url
    assert_response :success
  end

  test "should get index6" do
    get home_index6_url
    assert_response :success
  end

  test "should get index7" do
    get home_index7_url
    assert_response :success
  end

  test "should get index8" do
    get home_index8_url
    assert_response :success
  end

end
