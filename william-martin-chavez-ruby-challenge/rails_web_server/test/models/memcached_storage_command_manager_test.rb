require 'test_helper'

class MemcachedStorageCommandManagerTest < ActiveSupport::TestCase
 
  # CMemcachedRStorageCommandManager instance
 @@storageCommandManager = CMemcachedStorageCommandManager.new
 @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

#===========================
 #1) Set command tests:
 def test_execute_set_command
  result = @@storageCommandManager.execute_set_command("elementKeySet", "elementKeyValueSet")
  assert result == "The set: {elementKeySet, elementKeyValueSet} operation was successfuly completed."
 end

 def test_execute_set_command_result
  setCommandResult = @@retrievalCommandManager.execute_get_command("elementKeySet")
  assert setCommandResult == "elementKeyValueSet"
 end
 
 #===========================
 #2) Add command tests:
 
 def test_execute_add_command_failed
  result = @@storageCommandManager.execute_add_command("keyExist", "valueExist")
  assert result == "The add: {keyExist,valueExist} operation failed. The keyExist key already exists in server."
 end

 def test_execute_add_command_success
  result = @@storageCommandManager.execute_add_command("keyDoesNotExist", "newValue")
  assert result == "The add: {keyDoesNotExist,newValue} operation was successfuly completed."
 end

 def test_execute_add_command_result
  addCommandResult = @@retrievalCommandManager.execute_get_command("keyDoesNotExist")
  assert addCommandResult == "newValue"
 end

#===========================
 #3) Replace command tests:
 
 def test_execute_replace_command_failed
  result = @@storageCommandManager.execute_replace_command("specialKeyI", "specialValueI")
  assert result == "The replace: {specialKeyI,specialValueI} operation failed. The specialKeyI key does not exist in server."
 end

 def test_execute_replace_command_success
  @@storageCommandManager.execute_set_command("specialKeyII", "specialValeII")
  result = @@storageCommandManager.execute_replace_command("specialKeyII", "specialValeII")
  assert result == "The replace: {specialKeyII,specialValeII} operation was successfuly completed."
 end

 def test_execute_replace_command_result
  addCommandResult = @@retrievalCommandManager.execute_get_command("specialKeyII")
  assert addCommandResult == "specialValeII"
 end

end
