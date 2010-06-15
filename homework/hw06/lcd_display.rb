=begin
   
   Author: Charu Jain
   Homework 6 :lcd_display.rb
   Description: displays LCD style numbers at adjustable sizes. 
   Usage: ruby lcd_display.rb -s 4 123  (-s is optional for specifying the size)
          ruby lcd_display.rb 123 (default size is 2)
         
   Output: 
   
	   --   --
	|    |    |
	|    |    |
	   --   --
	| |       |
	| |       |
	   --   --

=end



class LCD

  def initialize (size)
    
	@size = size            #size for scaling
	space = ' '*@size     
    #Possible representations	
	skip   = " #{space} "   #fill up the space
	hor  = " #{'-'*@size} " #horizontal dash
	left  = "|#{space} "    #Left vertical bars
	right = " #{space}|"    #Right vertical bars
	both  = "|#{space}|"    #Both vertical bars
	

# codes for inidividual digits 
@codes = 
       #Each digit is stored as a hash of possible representations for 5 levels
       {'0'=>[hor,both,skip,both,hor],
        '1'=>[skip,right,skip,right,skip],
        '2'=>[hor,right,hor,left,hor],
        '3'=>[hor,right,hor,right,hor],
        '4'=>[skip,both,hor,right,skip],
        '5'=>[hor,left,hor,right,hor],
        '6'=>[hor,left,hor,both,hor],
        '7'=>[hor,right,skip,right,skip],
        '8'=>[hor,both,hor,both,hor], 
        '9'=>[hor,both,hor,right,hor]}
end


 
def display(digits)
    #digits :array of numbers passes 
	# Since there are 5 levels 
	for i in 0..4
	  #For each digit at one level, gather the segment
	  line = digits.collect{|d| @codes[d][i]}.join(' ')
	  
	  # For horizontal bars, there is no problem, as in horizontal dashes can be easily repeated as specified in 'hor' variable 
	  if i%2 == 0 
	    repeat = 1
	  else
	  # For vertical bars, there is a need to repeat them according to the size provided. 
        repeat = @size 
	  end
	  repeat.times{ puts line }
	    
   end
 end
end
  

#Parse the input from the user
input = ARGV

#If size is provided
if input.include? "-s"
	scale, size, numbers = input.join(' ').to_s.split(" ") 
else 
    numbers = ARGV[0]
	#default 
	size = 2
end

#Storing numbers into an array
digits = numbers.split(//)
#Create a new class instance passing the size as argument
lcd = LCD.new(size.to_i)
#display the digits
lcd.display(digits)


