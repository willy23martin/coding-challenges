class CMemcachedRetrievalCommandManager < CMemcachedManager

  #Get retrieval command: returns the value associated with the stored_key passed by parameter.
  #@params:
  #- stored_key: the key of the stored key-value object you want to get.
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

  #Gets retrieval command: returns the key-value objects associated with the stored_keys passed by parameter.
  #@params:
  #- stored_keys: the list of stored_keys separated by space (blank space character).
  def execute_gets_command(stored_keys)
    if(stored_keys == nil)
      return "You need to specify one key at least. You can specify more than one separated by blank space character."
    else
      pStoredKeys = stored_keys.split(" ")
      return @dalliMemcachedClient.get_multi(pStoredKeys)
    end
  end
end