class CMemcachedRetrievalCommandManager < CMemcachedManager
  def execute_get_command(stored_key)
    if(stored_key == '')
      puts "The stored_key received was #{stored_key} and it is empty"
      return "The stored_key received was #{stored_key} and it is empty"
    else
      puts "The stored_key received was #{stored_key}."
      puts @dalliMemcachedClient.get(stored_key)
      value = @dalliMemcachedClient.get(stored_key)
      puts "The result of the command in the manager class was #{value}"
      return value
    end
  end

  def execute_gets_command(stored_keys)
    if(stored_keys == nil)
      return "You need to specify one key at least. You can specify more than one separated by blank space"
    else
      pStoredKeys = stored_keys.split(" ")
      return @dalliMemcachedClient.get_multi(pStoredKeys)
    end
  end
end