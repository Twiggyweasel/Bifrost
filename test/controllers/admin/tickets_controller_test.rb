require 'test_helper'

class Admin::TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_tickets_show_url
    assert_response :success
  end

end
