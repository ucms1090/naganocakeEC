require "test_helper"

class Admin::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_addresses_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_addresses_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_addresses_edit_url
    assert_response :success
  end
end
