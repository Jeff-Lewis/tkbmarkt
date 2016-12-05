require 'test_helper'

class MstatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mstat = mstats(:one)
  end

  test "should get index" do
    get mstats_url
    assert_response :success
  end

  test "should get new" do
    get new_mstat_url
    assert_response :success
  end

  test "should create mstat" do
    assert_difference('Mstat.count') do
      post mstats_url, params: { mstat: { name: @mstat.name } }
    end

    assert_redirected_to mstat_url(Mstat.last)
  end

  test "should show mstat" do
    get mstat_url(@mstat)
    assert_response :success
  end

  test "should get edit" do
    get edit_mstat_url(@mstat)
    assert_response :success
  end

  test "should update mstat" do
    patch mstat_url(@mstat), params: { mstat: { name: @mstat.name } }
    assert_redirected_to mstat_url(@mstat)
  end

  test "should destroy mstat" do
    assert_difference('Mstat.count', -1) do
      delete mstat_url(@mstat)
    end

    assert_redirected_to mstats_url
  end
end
