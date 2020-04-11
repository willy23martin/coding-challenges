class CMemcachedStorageCommandManager < CMemcachedManager
    #Set storage command: store the key-value pair in the memcached server.
    #@params:
    #- new_key: the key of the new key-value object you want to store.
    #- new_value: the value of the new key-value object you want to store.
    def execute_set_command(new_key, new_value)
        if(new_key == '')
          puts "The new_key received was #{stored_key} and it is empty."
          return "The new_key received was #{stored_key} and it is empty."
        elsif(new_key == nil)
          puts "The new_key received was #{nil} and it is nil."
          return "The new_key received was #{new_key} and it is not defined."
        else
          puts "The new_key received was #{new_key}."
          @dalliMemcachedClient.set(new_key, new_value)
          return "The operation was successfuly completed."
        end
      end
end
