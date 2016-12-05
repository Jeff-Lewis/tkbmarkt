require 'test_helper'

class ListaccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listaccount_index_url
    assert_response :success
  end

end
