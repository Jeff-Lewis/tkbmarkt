require 'test_helper'

class PartnerLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner_link = partner_links(:one)
  end

  test "should get index" do
    get partner_links_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_link_url
    assert_response :success
  end

  test "should create partner_link" do
    assert_difference('PartnerLink.count') do
      post partner_links_url, params: { partner_link: { name: @partner_link.name } }
    end

    assert_redirected_to partner_link_url(PartnerLink.last)
  end

  test "should show partner_link" do
    get partner_link_url(@partner_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_link_url(@partner_link)
    assert_response :success
  end

  test "should update partner_link" do
    patch partner_link_url(@partner_link), params: { partner_link: { name: @partner_link.name } }
    assert_redirected_to partner_link_url(@partner_link)
  end

  test "should destroy partner_link" do
    assert_difference('PartnerLink.count', -1) do
      delete partner_link_url(@partner_link)
    end

    assert_redirected_to partner_links_url
  end
end
