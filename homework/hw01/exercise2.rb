=begin
Author: Charu Jain
Homework1: exercise2.rb
Description: When the program runs, it returns two foerunes, ensuring that the same fortune does not show up twice 
Usage: ruby exercise2.rb
=end


class Fortune

  def initialize 
  @Fortunes = ["You will learn Ruby soon", "You will get an A for this course", "You will meet someone special!", "You will win a lottery today", "The Redsox will win the superbowl", "You will have a wonderful day", "You will receive a good news this weekend", "You will learn Android soon"]
  #Array for storing already seen fortunes
  @seen_fortunes = Array.new
  end
    def next_fortune
	#File 'past_fortunes' is used store array @seen_fortunes 
    # Check if file exists 
	#Initially available fortunes is equal to the Fortunes array
	available = @Fortunes
	if File.exist?("past_fortunes")
	   # Open the file for reading 
	   f = File.new("past_fortunes","r") 
	   #Load the contents of file using Marshal command into @seen_fortunes
	   @seen_fortunes.push(Marshal.load(f))
	   
	   #Check if every fortune has been seen once, then reset the array @seen_fortunes
       if @seen_fortunes.length == @Fortunes.length
	     @seen_fortunes =[]
       end
	   # Get a list of Available fortunes
	   available = @Fortunes - @seen_fortunes
	   
	end  
	#Select a random fortune from available fortunes  
    curr_fortune = available[(rand * available.length).to_int]
	#Push the curr_fortune to @seen_fortunes
	@seen_fortunes.push(curr_fortune)
	# The array @seeb_fortunes is dumped into a file using Marshal.dump(..)
	File.open("past_fortunes",'w+') do |f|
    Marshal.dump(@seen_fortunes,f)
	end
    
  return curr_fortune   

  end

end

if __FILE__ == $0 
  f = Fortune.new
  puts f.next_fortune
  puts f.next_fortune
end
