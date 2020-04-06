require 'dalli'
options = { :username => 'mooveit', :password => 'mooveit' }
dc = Dalli::Client.new('192.168.1.235:11211', options)
dc.set('elementKey', 99856)
value = dc.get('elementKey')
puts "The key elementKey has a value: #{value}."