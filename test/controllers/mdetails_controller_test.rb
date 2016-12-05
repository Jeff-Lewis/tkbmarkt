require 'test_helper'

class MdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdetail = mdetails(:one)
  end

  test "should get index" do
    get mdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_mdetail_url
    assert_response :success
  end

  test "should create mdetail" do
    assert_difference('Mdetail.count') do
      post mdetails_url, params: { mdetail: { name: @mdetail.name } }
    end

    assert_redirected_to mdetail_url(Mdetail.last)
  end

  test "should show mdetail" do
    get mdetail_url(@mdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdetail_url(@mdetail)
    assert_response :success
  end

  test "should update mdetail" do
    patch mdetail_url(@mdetail), params: { mdetail: { name: @mdetail.name } }
    assert_redirected_to mdetail_url(@mdetail)
  end

  test "should destroy mdetail" do
    assert_difference('Mdetail.count', -1) do
      delete mdetail_url(@mdetail)
    end

    assert_redirected_to mdetails_url
  end
end
