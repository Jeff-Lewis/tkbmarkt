require 'test_helper'

class StatementControllerTest < ActionDispatch::IntegrationTest
  test "should get index1" do
    get statement_index1_url
    assert_response :success
  end

end
