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

mbean = "dummy"

puts "------------------------------------------------------"
puts "Which MBean? (e.g org.apache.cassandra.db:type=Caches)"
puts "------------------------------------------------------"

mbean_name = gets
mbean_name = mbean_name.chomp

mbean = JMX::MBean.find_by_name mbean_name

puts "-------------------------------------------------------------------------"
puts "There are following attributes that are available for the selected MBean:"
puts "-------------------------------------------------------------------------"

puts mbean.attributes.keys

attribute_name = "dummy"

puts "-----------------------------------------------------------------"
puts "Which attribute do you want to request, please type it correctly?"
puts "-----------------------------------------------------------------"

attribute_name = gets
attribute_name = attribute_name.chomp

puts "------------------------------------------------------"
puts "The value of this selected attribute #{attribute_name}"
puts "------------------------------------------------------"

puts mbean.send(attribute_name.to_sym)