require 'test_helper'

class MemcachedStorageCommandManagerTest < ActiveSupport::TestCase
 
  # CMemcachedRStorageCommandManager instance
 @@storageCommandManager = CMemcachedStorageCommandManager.new
 @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

 test "test_execute_set_command" do
  result = @@storageCommandManager.execute_set_command("elementKeySet", "elementKeyValueSet")
  puts "The key elementKeySet has a value: #{result}"
  assert result == "The operation was successfuly completed."
 end

 test "test_execute_set_command_result" do
  setCommandResult = @@retrievalCommandManager.execute_get_command("elementKeySet")
  assert setCommandResult == "elementKeyValueSet"
 end
 
end
