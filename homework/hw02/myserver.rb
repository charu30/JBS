=begin

Author: Charu Jain
Homework2: myserver.rb
Description:
* awaits a connection over port 8888
* if text that is sent is "t" or "time", then, the server responds with time of day
* if text that is sent is "f" or "message/fortune", then the server responds with a fortune
* if the text that is sent is d followed by a filename (e.g. dtest.txt) then respond with that file
Usage: ruby myserver.rb
       Run myclient.rb to send the text. 
=end


require 'gserver'

#List of fortunes
FORTUNES = ["You will learn a lot", "You will get an 'A'", 
            "You still have much to learn, Grasshopper"]
#List of Jokes
JOKES = [" Q. Where do you find a one legged dog? A. Where you left it.", 
         "Two muffins are in the oven. One says to the other \"God it's hot in here\" The other one replies \"Oh no... It's a talking muffin\""] 

		 
class MyServer < GServer

  def initialize(*args)
    super(*args)    
    @@client_id = 0
  end
  
  def serve(io_object)
    # To keep a track of number of client connections, assigns the incoming connection an id
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
      
	  #Regex is used to match 't' or 'time'
	   when /^(t|time)$/
	  #Time is displayed
          io_object.puts "The time now is#{Time.now.strftime(" %I:%M %p")}"
      
	  #/^ and $ will only match the enclosed string, i.e f or message/fortune
      when /^(f|message\/fortune)$/ 
	  #A fortune is displayed
        io_object.puts FORTUNES[FORTUNES.length * rand]
      
      #'d' should not be matched to the following regex, so used ^ and $
      when /^date$/
        io_object.puts "Today date is #{Time.now.month}-#{Time.now.day}-#{Time.now.year}"
      
      #Return a joke      
      when /^(joke|message\/joke)$/
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
	  # Quit the server
	  when "quit"
        puts "Exiting!"
        break    
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