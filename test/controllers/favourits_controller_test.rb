require 'test_helper'

class FavouritsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourit = favourits(:one)
  end

  test "should get index" do
    get favourits_url
    assert_response :success
  end

  test "should get new" do
    get new_favourit_url
    assert_response :success
  end

  test "should create favourit" do
    assert_difference('Favourit.count') do
      post favourits_url, params: { favourit: { name: @favourit.name } }
    end

    assert_redirected_to favourit_url(Favourit.last)
  end

  test "should show favourit" do
    get favourit_url(@favourit)
    assert_response :success
  end

  test "should get edit" do
    get edit_favourit_url(@favourit)
    assert_response :success
  end

  test "should update favourit" do
    patch favourit_url(@favourit), params: { favourit: { name: @favourit.name } }
    assert_redirected_to favourit_url(@favourit)
  end

  test "should destroy favourit" do
    assert_difference('Favourit.count', -1) do
      delete favourit_url(@favourit)
    end

    assert_redirected_to favourits_url
  end
end
