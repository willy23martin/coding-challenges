class CMemcachedStorageCommandManager < CMemcachedManager
    
    #1) Set storage command: store the key-value pair in the memcached server.
    #@params:
    #- new_key: the key of the new key-value object you want to store.
    #- new_value: the value of the new key-value object you want to store.
    #- raw: true - if the value to store wants to be able to prepend/append or not.
    def execute_set_command(new_key, new_value, raw)
      puts "Raw: #{raw}"
      if(raw == "1")
        raw = true
      else
        raw = false
      end 
        if(new_key == '')
          puts "The new_key received was #{new_key} and it is empty."
          return "The new_key received was #{new_key} and it is empty."
        elsif(new_key == nil)
          puts "The new_key received was #{nil} and it is nil."
          return "The new_key received was #{new_key} and it is not defined."
        else
          puts "The new_key received was #{new_key}."
          begin
            @dalliMemcachedClient.set(new_key, new_value, 0, raw:raw)
          rescue Dalli::DalliError => dalliError
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
    #- raw: true - if the value to store wants to be able to prepend/append or not.
    def execute_add_command(new_key, new_value,raw)
      puts "Raw: #{raw}"
      if(raw == "1")
        raw = true
      else
        raw = false
      end 

      if(new_key == '')
        puts "The new_key received was #{new_key} and it is empty."
        return "The new_key received was #{new_key} and it is empty."
      elsif(new_key == nil)
        puts "The new_key received was #{nil} and it is nil."
        return "The new_key received was #{new_key} and it is not defined."
      else
        puts "The new_key received was #{new_key}."
        begin
          @dalliMemcachedClient.add(new_key, new_value,0,raw:raw)
        rescue Dalli::DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The add: {#{new_key},#{new_value}} operation failed. The #{new_key} key already exist in server."
        else
          return "The add: {#{new_key},#{new_value}} operation was successfuly completed."
        end
      end
    end

    #3) Replace storage command: store this data, but only if the server does already hold data for this key.
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

    #4) Append storage command: add the value passed by parameter to an existing key after existing values of the key-rawValue object.
    #@params:
    #- key: the key of the key-value of the object you want the new value to be appended.
    #- new_value: the value of the key-value object you want to append.
    def execute_append_command(key, new_value)
      if(key == '')
        puts "The key received was #{key} and it is empty."
        return "The key received was #{key} and it is empty."
      elsif(key == nil)
        puts "The key received was #{nil} and it is nil."
        return "The key received was #{nil} and it is not defined."
      else
        puts "The key received was #{key}."
        begin
          @dalliMemcachedClient.append(key, new_value)
        rescue Dalli::DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The append: {#{key},#{new_value}} operation failed. The #{key} key does not exist in server."
        else
          return "The append: {#{key},#{new_value}} operation was successfuly completed."
        end
      end
    end

    #5) Prepend storage command: add the new value passed by parameter to an existing key before existing values related to that key-rawValue object.
    #@params:
    #- key: the key of the key-value of the object you want the new value prepended.
    #- new_value: the value of the key-value object you want to prepend.
    def execute_prepend_command(key, new_value)
      if(key == '')
        puts "The key received was #{key} and it is empty."
        return "The key received was #{key} and it is empty."
      elsif(key == nil)
        puts "The key received was #{nil} and it is nil."
        return "The key received was #{nil} and it is not defined."
      else
        puts "The key received was #{key}."
        begin
          @dalliMemcachedClient.prepend(key, new_value)
        rescue Dalli::DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The prepend: {#{key},#{new_value}} operation failed. The #{key} key does not exist in server."
        rescue Dalli::UnmarshalError => marshallError
          puts  "Error Message: #{marshallError.message}"
          return "The prepend: {#{key},#{new_value}} operation failed. Error: #{marshallError.message}."
        else
          return "The prepend: {#{key},#{new_value}} operation was successfuly completed."
        end
      end
    end

    #6) Cas storage command: store the new key-value object passed by parameters but only if no client has updated the same key since this client last fetched it.
    #@params:
    #- key: the key of the key-value of the object to verify the storage condition.
    #- new_value: the value of the key-value object you want to replace.
    #- raw: true - if the value to store wants to be able to prepend/append or not.
    def execute_cas_command(key,new_value,raw)
      puts "Raw: #{raw}"
      if(raw == "1")
        raw = true
      else
        raw = false
      end 
      @result = ""
      if(key == '')
        puts "The key received was #{key} and it is empty."
        return "The key received was #{key} and it is empty."
      elsif(key == nil)
        puts "The key received was #{nil} and it is nil."
        return "The key received was #{nil} and it is not defined."
      else
        puts "The key received was #{key}."
        begin
          @result = @dalliMemcachedClient.cas(key, 0,raw:raw){
            new_value
          }
          puts "Cas result: #{@result}"
        rescue Dalli::DalliError => dalliError
          puts  "Error Message: #{dalliError.message}"
          return "The cas: {#{key},#{new_value}} operation failed. The #{key} key does not exist in server."
        else
          return "The cas: {#{key},#{new_value}} operation was successfuly completed. Cas_token:#{@result}"
        end
      end
    end

end
