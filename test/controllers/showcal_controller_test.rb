require 'test_helper'

class ShowcalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get showcal_index_url
    assert_response :success
  end

end
