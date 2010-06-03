=begin

Author: Charu Jain
Homework2: myclient
Date: 06/03/2010

This program displays a prompt: >>
* when user types in, a connection is made to server, over port 8888, and text is sent
* whatever comes back is displayed on the console

=end

require 'socket'

# Open a socket at port 8888 on localhost
tcp_socket = TCPSocket.open('localhost', 8888)

# Loop over until user types in 'quit'
loop do
  print ">>"
  command_string = gets.chomp
  break if command_string =~ /quit/
  #Send the command to the server
  tcp_socket.puts command_string
  # Read the response from the server
  servers_resp = tcp_socket.readline
  #Replace the newline back to avoid the EOF error 
  puts servers_resp.to_s.gsub("/n/n","\n")
  
end

