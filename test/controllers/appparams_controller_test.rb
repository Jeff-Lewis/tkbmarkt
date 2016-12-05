require 'test_helper'

class AppparamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appparam = appparams(:one)
  end

  test "should get index" do
    get appparams_url
    assert_response :success
  end

  test "should get new" do
    get new_appparam_url
    assert_response :success
  end

  test "should create appparam" do
    assert_difference('Appparam.count') do
      post appparams_url, params: { appparam: { name: @appparam.name } }
    end

    assert_redirected_to appparam_url(Appparam.last)
  end

  test "should show appparam" do
    get appparam_url(@appparam)
    assert_response :success
  end

  test "should get edit" do
    get edit_appparam_url(@appparam)
    assert_response :success
  end

  test "should update appparam" do
    patch appparam_url(@appparam), params: { appparam: { name: @appparam.name } }
    assert_redirected_to appparam_url(@appparam)
  end

  test "should destroy appparam" do
    assert_difference('Appparam.count', -1) do
      delete appparam_url(@appparam)
    end

    assert_redirected_to appparams_url
  end
end
