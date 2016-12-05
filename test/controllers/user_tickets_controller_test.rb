require 'test_helper'

class UserTicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_ticket = user_tickets(:one)
  end

  test "should get index" do
    get user_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_user_ticket_url
    assert_response :success
  end

  test "should create user_ticket" do
    assert_difference('UserTicket.count') do
      post user_tickets_url, params: { user_ticket: { name: @user_ticket.name } }
    end

    assert_redirected_to user_ticket_url(UserTicket.last)
  end

  test "should show user_ticket" do
    get user_ticket_url(@user_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_ticket_url(@user_ticket)
    assert_response :success
  end

  test "should update user_ticket" do
    patch user_ticket_url(@user_ticket), params: { user_ticket: { name: @user_ticket.name } }
    assert_redirected_to user_ticket_url(@user_ticket)
  end

  test "should destroy user_ticket" do
    assert_difference('UserTicket.count', -1) do
      delete user_ticket_url(@user_ticket)
    end

    assert_redirected_to user_tickets_url
  end
end
