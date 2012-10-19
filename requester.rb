require 'rubygems'
require 'java'
require 'jmx4r'

puts "--------------------------------------------------------"
puts "Welcome!"
puts "You're using now MBean Requester, developed by AIFB, KIT"
puts "Version 0.0.1"
puts "--------------------------------------------------------"

host = "dummy"
puts "------------------------------------------------------------------------"
puts "URL of the Machine where Cassandra is running (e.g.: localhost, 1.2.3.4)"
puts "------------------------------------------------------------------------"
# get input from user
host = gets  
host = host.chomp # delete the last enter character

port = "dummy"
puts "--------------------------------------------------------------------"
puts "Port for JMX of the Machine where Cassandra is running (e.g. : 7199)"
puts "--------------------------------------------------------------------"
# get input from user
port = gets  
port = port.chomp # delete the last enter character

JMX::MBean.establish_connection :host => host, :port => port.to_i
caches = JMX::MBean.find_by_name "org.apache.cassandra.db:type=Caches"
puts caches.key_cache_size