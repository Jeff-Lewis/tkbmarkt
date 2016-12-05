require 'test_helper'

class CustomerAdvisorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_advisor_index_url
    assert_response :success
  end

  test "should get index2" do
    get customer_advisor_index2_url
    assert_response :success
  end

end
