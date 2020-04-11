class MemcachedStorageCommandManager < ApplicationRecord
  @@storageCommandManager = CMemcachedStorageCommandManager.new

  #1)Set command:
  def execute_set_command(new_key, new_value)
    puts "Set command was executed with #{new_key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_set_command(new_key, new_value)
    puts "The result of the command is #{result}."
    return result
  end

end
