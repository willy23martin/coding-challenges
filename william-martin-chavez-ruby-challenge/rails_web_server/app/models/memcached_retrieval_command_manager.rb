require 'dalli'
class MemcachedRetrievalCommandManager < ApplicationRecord
  # CMemcachedRetrievalCommandManager instance
  @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

  #1) Get command:
  def execute_get_command(stored_key)
    puts "Get command was executed with #{stored_key} as a key"
    result = @@retrievalCommandManager.execute_get_command(stored_key)
    puts "The result of the command is #{result}"
    return result
  end

  #2) Gets command:
  def execute_gets_command(stored_keys)
    puts "Gets command was executed with #{stored_keys} as a keys"
    result = @@retrievalCommandManager.execute_gets_command(stored_keys)
    puts "The result of the command is #{result}"
    return result
  end

end
