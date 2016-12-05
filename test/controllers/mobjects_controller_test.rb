require 'test_helper'

class MobjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobject = mobjects(:one)
  end

  test "should get index" do
    get mobjects_url
    assert_response :success
  end

  test "should get new" do
    get new_mobject_url
    assert_response :success
  end

  test "should create mobject" do
    assert_difference('Mobject.count') do
      post mobjects_url, params: { mobject: { name: @mobject.name } }
    end

    assert_redirected_to mobject_url(Mobject.last)
  end

  test "should show mobject" do
    get mobject_url(@mobject)
    assert_response :success
  end

  test "should get edit" do
    get edit_mobject_url(@mobject)
    assert_response :success
  end

  test "should update mobject" do
    patch mobject_url(@mobject), params: { mobject: { name: @mobject.name } }
    assert_redirected_to mobject_url(@mobject)
  end

  test "should destroy mobject" do
    assert_difference('Mobject.count', -1) do
      delete mobject_url(@mobject)
    end

    assert_redirected_to mobjects_url
  end
end
