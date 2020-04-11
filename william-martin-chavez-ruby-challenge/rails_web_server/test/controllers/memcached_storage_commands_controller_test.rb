require 'test_helper'

class MemcachedStorageCommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memcached_storage_commands_index_url
    assert_response :success
  end

end
