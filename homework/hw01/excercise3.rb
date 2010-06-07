=begin
Author: Charu Jain
Homework1: exercise2.rb
Description: Each time exercise2.rb is run from the command line it displays a random fortune.
Usage: ruby exercise2.rb

=end

require 'socket'               # Get sockets from stdlib
require 'exercise2.rb'

new_fortune = Fortune.new

server = TCPServer.open(8888)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  Client.puts(new_fortune.next_fortune)
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}
