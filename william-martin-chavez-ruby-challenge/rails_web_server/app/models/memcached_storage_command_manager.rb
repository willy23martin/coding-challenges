class MemcachedStorageCommandManager < ApplicationRecord
  @@storageCommandManager = CMemcachedStorageCommandManager.new

  #1)Set command:
  def execute_set_command(new_key, new_value)
    puts "Set command was executed with #{new_key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_set_command(new_key, new_value)
    puts "The result of the command is #{result}."
    return result
  end

  
  #2)Add command:
  def execute_add_command(new_key, new_value)
    puts "Add command was executed with #{new_key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_add_command(new_key, new_value)
    puts "The result of the command is #{result}."
    return result
  end

  #3) Replace command:
  def execute_replace_command(key, new_value)
    puts "Replace command was executed with #{key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_replace_command(key, new_value)
    puts "The result of the command is #{result}."
    return result
  end


end
