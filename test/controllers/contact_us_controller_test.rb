require 'test_helper'

class ContactUsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_us_index_url
    assert_response :success
  end

  test "should get show" do
    get contact_us_show_url
    assert_response :success
  end

end
