require 'test_helper'

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get event_post_url
    assert_response :success
  end

end
