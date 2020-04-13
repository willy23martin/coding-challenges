class MemcachedStorageCommandManager < ApplicationRecord
  @@storageCommandManager = CMemcachedStorageCommandManager.new

  #1)Set command:
  def execute_set_command(new_key, new_value, raw)
    puts "Set command was executed with #{new_key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_set_command(new_key, new_value, raw)
    puts "The result of the command is #{result}."
    return result
  end

  
  #2)Add command:
  def execute_add_command(new_key, new_value, raw)
    puts "Add command was executed with #{new_key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_add_command(new_key, new_value, raw)
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

  #4) Append command:
  def execute_append_command(key, new_value)
    puts "Append command was executed with #{key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_append_command(key, new_value)
    puts "The result of the command is #{result}."
    return result
  end
  
  #5) Prepend command:
  def execute_prepend_command(key, new_value)
    puts "Prepend command was executed with #{key} as a key and #{new_value} as value."
    result = @@storageCommandManager.execute_prepend_command(key, new_value)
    puts "The result of the command is #{result}."
    return result
  end

end
