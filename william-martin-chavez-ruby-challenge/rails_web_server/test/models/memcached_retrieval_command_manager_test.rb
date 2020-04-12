require 'test_helper'

class MemcachedRetrievalCommandManagerTest < ActiveSupport::TestCase

  # CMemcachedRetrievalCommandManager instance
  @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

  def test_execute_get_command
   @getCommandResult = @@retrievalCommandManager.execute_get_command("elementKey")
   assert @getCommandResult == 99856
  end

  def test_execute_gets_command
    @getCommandResult = @@retrievalCommandManager.execute_gets_command(["elementKey", "mooveitKey"])
    assert @getCommandResult["elementKey"] == 99856 && @getCommandResult["mooveitKey"] == "Amazing"
  end

end
