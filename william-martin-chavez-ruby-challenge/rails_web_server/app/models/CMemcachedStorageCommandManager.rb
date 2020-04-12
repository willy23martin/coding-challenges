class CMemcachedStorageCommandManager < CMemcachedManager
    
    #1) Set storage command: store the key-value pair in the memcached server.
    #@params:
    #- new_key: the key of the new key-value object you want to store.
    #- new_value: the value of the new key-value object you want to store.
    def execute_set_command(new_key, new_value)
        if(new_key == '')
          puts "The new_key received was #{new_key} and it is empty."
          return "The new_key received was #{new_key} and it is empty."
        elsif(new_key == nil)
          puts "The new_key received was #{nil} and it is nil."
          return "The new_key received was #{new_key} and it is not defined."
        else
          puts "The new_key received was #{new_key}."
          begin
            @dalliMemcachedClient.set(new_key, new_value)
          rescue DalliError => dalliError
            puts  "Error Message: #{dalliError.message}"
            return "The set: {#{new_key},#{new_value}} operation failed."
          else
            return "The set: {#{new_key},#{new_value}} operation was successfuly completed."
          end
        end
      end

    #2) Add storage command: store the key-value pair in the memcached server only if the server does not retain a value for that key.
    #@params:
    #- new_key: the key of the new key-value object you want to store.
    #- new_value: the value of the new key-value object you want to store.
    def execute_add_command(new_key, new_value)
      if(new_key == '')
        puts "The new_key received was #{new_key} and it is empty."
        return "The new_key received was #{new_key} and it is empty."
      elsif(new_key == nil)
        puts "The new_key received was #{nil} and it is nil."
        return "The new_key received was #{new_key} and it is not defined."
      else
        puts "The new_key received was #{new_key}."
        begin
          @dalliMemcachedClient.add(new_key, new_value)
        rescue DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The add: {#{new_key},#{new_value}} operation failed. The #{new_key} key already exist in server."
        else
          return "The add: {#{new_key},#{new_value}} operation was successfuly completed."
        end
      end
    end

    #2) Replace storage command: store this data, but only if the server does already hold data for this key.
    #@params:
    #- key: the key of the new key-value object you want to replace.
    #- new_value: the value of the new key-value object you want to replace.
    def execute_replace_command(key, new_value)
      if(key == '')
        puts "The key received was #{key} and it is empty."
        return "The key received was #{key} and it is empty."
      elsif(key == nil)
        puts "The key received was #{nil} and it is nil."
        return "The key received was #{nil} and it is not defined."
      else
        puts "The key received was #{key}."
        begin
          @dalliMemcachedClient.replace(key, new_value)
        rescue DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The replace: {#{key},#{new_value}} operation failed. The #{key} key does not exist in server."
        else
          return "The replace: {#{key},#{new_value}} operation was successfuly completed."
        end
      end
    end

end
