=begin
Author: Charu Jain
Homework1: exercise3.rb
Description: Write an application to create a socket to listen on port 8888
             Whenever a client connects to it, it returns the time of day
Usage: ruby exercise3.rb
=end

require 'socket'               # Get sockets from stdlib
require 'exercise2.rb'

new_fortune = Fortune.new

server = TCPServer.open(8888)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept
  client.puts(new_fortune.next_fortune)
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
