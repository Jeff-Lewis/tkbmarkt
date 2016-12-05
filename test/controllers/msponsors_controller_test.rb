require 'test_helper'

class MsponsorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @msponsor = msponsors(:one)
  end

  test "should get index" do
    get msponsors_url
    assert_response :success
  end

  test "should get new" do
    get new_msponsor_url
    assert_response :success
  end

  test "should create msponsor" do
    assert_difference('Msponsor.count') do
      post msponsors_url, params: { msponsor: { name: @msponsor.name } }
    end

    assert_redirected_to msponsor_url(Msponsor.last)
  end

  test "should show msponsor" do
    get msponsor_url(@msponsor)
    assert_response :success
  end

  test "should get edit" do
    get edit_msponsor_url(@msponsor)
    assert_response :success
  end

  test "should update msponsor" do
    patch msponsor_url(@msponsor), params: { msponsor: { name: @msponsor.name } }
    assert_redirected_to msponsor_url(@msponsor)
  end

  test "should destroy msponsor" do
    assert_difference('Msponsor.count', -1) do
      delete msponsor_url(@msponsor)
    end

    assert_redirected_to msponsors_url
  end
end
