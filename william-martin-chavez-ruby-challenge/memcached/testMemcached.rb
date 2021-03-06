require 'dalli'
options = { :username => 'mooveit', :password => 'mooveit' }
dc = Dalli::Client.new('192.168.1.235:11211', options)
dc.set("mooveitKey", "Amazing")
value = dc.get('mooveitKey')
puts "The key mooveitKey has a value: #{value}."
dc.set("elementKey", 99856)
value = dc.get("elementKey")
puts "The key elementKey has a value: #{value}."
puts dc.set("mooveitToAppend", "Amazing Append", 0, raw:true)
value = dc.get("mooveitToAppend")
puts "The key mooveitToAppend has a value: #{value}."
puts dc.set("mooveitToPrepend", "Amazing Prepend", 0, raw:true)
value = dc.get("mooveitToPrepend")
puts "The key mooveitToPrepend has a value: #{value}."