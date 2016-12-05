require 'test_helper'

class MadvisorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @madvisor = madvisors(:one)
  end

  test "should get index" do
    get madvisors_url
    assert_response :success
  end

  test "should get new" do
    get new_madvisor_url
    assert_response :success
  end

  test "should create madvisor" do
    assert_difference('Madvisor.count') do
      post madvisors_url, params: { madvisor: { name: @madvisor.name } }
    end

    assert_redirected_to madvisor_url(Madvisor.last)
  end

  test "should show madvisor" do
    get madvisor_url(@madvisor)
    assert_response :success
  end

  test "should get edit" do
    get edit_madvisor_url(@madvisor)
    assert_response :success
  end

  test "should update madvisor" do
    patch madvisor_url(@madvisor), params: { madvisor: { name: @madvisor.name } }
    assert_redirected_to madvisor_url(@madvisor)
  end

  test "should destroy madvisor" do
    assert_difference('Madvisor.count', -1) do
      delete madvisor_url(@madvisor)
    end

    assert_redirected_to madvisors_url
  end
end
