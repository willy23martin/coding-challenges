require 'test_helper'

class MemcachedRetrievalCommandManagerTest < ActiveSupport::TestCase

  # CMemcachedRetrievalCommandManager instance
  @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

  test "test_execute_get_command" do
   @getCommandResult = @@retrievalCommandManager.execute_get_command("elementKey")
   puts "The key elementKey has a value: #{@getCommandResult}."
   assert @getCommandResult == 99856
  end

  test "test_execute_gets_command" do
    
    @getCommandResult = @@retrievalCommandManager.execute_gets_command(["elementKey", "mooveitKey"])
    puts "The result was: #{@getCommandResult}"
    puts @getCommandResult[:elementKey]
    puts @getCommandResult[:mooveitKey]
    assert @getCommandResult["elementKey"] == 99856
    assert @getCommandResult["mooveitKey"] == "Amazing"
  end

end
