require 'test_helper'

class MemcachedManagerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memcached_manager_index_url
    assert_response :success
  end

end
