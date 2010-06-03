=begin

Author: Charu Jain
Homework2: myserver.rb
Date: 06/03/2010

* awaits a connection over port 8888
* if text that is sent is "t" or "time", then, the server responds with time of day
* if text that is sent is "f" or "message/fortune", then the server responds with a fortune
* if the text that is sent is d followed by a filename (e.g. dtest.txt) then respond with that file
=end


require 'gserver'

FORTUNES = ["You will learn a lot", "You will get an 'A'", 
            "You still have much to learn, Grasshopper"]

JOKES = [" Q. Where do you find a one legged dog? A. Where you left it.", 
         "Two muffins are in the oven. One says to the other \"God it's hot in here\" The other one replies \"Oh no... It's a talking muffin\""] 

class MyServer < GServer

  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  def serve(io_object)
    # To keep a track of number of client connections
    @@client_id += 1
    my_client_id = @@client_id
    io_object.sync = true
    
    puts("Client #{@@client_id} attached.")
    loop do
      # Received line from client
      line = io_object.readline.chomp
       puts line

      # Compare the line to various cases
      case line
      when /^t/ || 'time'
          io_object.puts "The time of day is #{Time.now}"
      
      when "quit"
        puts "Exiting!"
        break
      
      when /^f/ 
        io_object.puts FORTUNES[FORTUNES.length * rand]
            
      when "date"
        io_object.puts "Today date is #{Time.now.month}-#{Time.now.day}-#{Time.now.year}"
      
      when "message/fortune" 
        io_object.puts FORTUNES[FORTUNES.length * rand]
            
      when "joke"
         io_object.puts JOKES[JOKES.length * rand]
      
      when "message/joke" 
        io_object.puts JOKES[JOKES.length * rand]
        
      # Get the file name removing 'd'
      when /^d(.+)/
        file = $1
        # Check if file exists or not
        if File.exist?(file)
          # Store the contents of file into a string usinf File.read
          contents = File.read(file) 
          # replace the newline so that readline in client works properly
          contents.gsub!("\n", "/n/n")
          io_object.puts contents
        else
          io_object.puts "File {file} doesn't exists"
        end
           
      # If input from client doesn't match any of the above case           
      else
        puts "received line #{line}"
        io_object.puts "What does #{line} mean anyway?"
      end
    end
  end
end

puts "Starting to listen for a connection on port 8888"
server = MyServer.new(8888)
server.start
server.join