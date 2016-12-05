require 'test_helper'

class TicketuserviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index2" do
    get ticketuserview_index2_url
    assert_response :success
  end

end
