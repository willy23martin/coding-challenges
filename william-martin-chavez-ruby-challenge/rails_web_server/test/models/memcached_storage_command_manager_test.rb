require 'test_helper'

class MemcachedStorageCommandManagerTest < ActiveSupport::TestCase
 
  # CMemcachedRStorageCommandManager instance
 @@storageCommandManager = CMemcachedStorageCommandManager.new
 @@retrievalCommandManager = CMemcachedRetrievalCommandManager.new

#===========================
 #1) Set command tests:
 def test_execute_set_command
  @@storageCommandManager.execute_set_command("elementKeySet", "elementKeyValueSet", nil)
  @@storageCommandManager.execute_append_command("elementKeySet","newValueAppended")
  result = @@retrievalCommandManager.execute_get_command("elementKeySet")
  assert result == "elementKeyValueSet"
 end
 
 #===========================
 #2) Add command tests:
 
 def test_execute_add_command_failed
  @@storageCommandManager.execute_add_command("keyExist", "valueExist", nil)
  result = @@retrievalCommandManager.execute_get_command("keyExist")
  assert result == ""
 end

 def test_execute_add_command_success
  @@storageCommandManager.execute_add_command("keyDoesNotExist", "newValue", nil)
  @@storageCommandManager.execute_append_command("keyDoesNotExist","newValueAppended")
  result = @@retrievalCommandManager.execute_get_command("keyDoesNotExist")
  assert result == "newValue"
 end

#===========================
 #3) Replace command tests:
 
 def test_execute_replace_command_failed
  @@storageCommandManager.execute_replace_command("specialKey1", "specialValueI")
  result = @@retrievalCommandManager.execute_get_command("specialKey1")
  assert result == ""
 end

 def test_execute_replace_command_success
  @@storageCommandManager.execute_set_command("specialKeyII", "specialValueII", nil)
  @@storageCommandManager.execute_replace_command("specialKeyII", "specialValue2")
  result = @@retrievalCommandManager.execute_get_command("specialKeyII")
  assert result == "specialValue2"
 end

 #===========================
 #4) Append command tests:
 
 def test_execute_append_command_failed
  @@storageCommandManager.execute_set_command("appendKey","appendValue1", nil)
  @@storageCommandManager.execute_append_command("appendKey", "appendValue2")
  result = @@retrievalCommandManager.execute_get_command("appendKey")
  assert result == "appendValue1"
 end

 def test_execute_append_command_success
  @@storageCommandManager.execute_set_command("appendKeyII","appendValue1",1.to_s)
  @@storageCommandManager.execute_append_command("appendKeyII", "appendValue2")
  result = @@retrievalCommandManager.execute_get_command("appendKeyII")
  assert result == "appendValue1appendValue2"
 end

#===========================
 #5) Prepend command tests:
 def test_execute_prepend_command_failed
  @@storageCommandManager.execute_set_command("prependKeyII","prependValueI", nil)
  @@storageCommandManager.execute_prepend_command("prependKeyII", "prependValueZ")
  result = @@retrievalCommandManager.execute_get_command("prependKeyII")
  assert result == "prependValueI"
 end

 def test_execute_prepend_command_success
  @@storageCommandManager.execute_set_command("prependKeyII","prependValueI", 1.to_s)
  @@storageCommandManager.execute_prepend_command("prependKeyII", "prependValue0")
  result = @@retrievalCommandManager.execute_get_command("prependKeyII")
  assert result == "prependValue0prependValueI"
 end

 #===========================
 #6) Cas command tests:
 def test_execute_cas_command_success
  result1 = @@storageCommandManager.execute_cas_command("prependKeyII","casValue", 1.to_s)
  result = @@retrievalCommandManager.execute_get_command("prependKeyII")
  assert (result1.split(":")[1].to_i.is_a? Integer)==true && result == "casValue"
 end

end
