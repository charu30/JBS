=begin
   
   Author: Charu Jain
   Homework 3
   Description: Translate a postfix expression into a infix expression, minimizing the number of parentheses
   To run: ruby postfix.rb 'a postfix expression'
   eg. ruby postfix.rb '2 3 * 4 +'   

=end


class Postfix_to_Infix

def initialize
  #Precedence of operators
  @precedence =  {'+' => 1, '-' => 1, '*' => 2, '/' => 2 }
end 

# To check the precedence of outer(new) operator over the inner operator in the compound operand to minimize the parentheses.
# Eg. In '2 3 * 4 *', there is no need of parentheses, as it is same as (2*3)*4 is same as 2*3*4
def check_precedence(outer, inner) 
   if @precedence[outer] == @precedence[inner] 
      return false
    
   elsif @precedence[outer] > @precedence[inner]
      return true
   end
end

# Parse each part of the expression 
def parse(expression)
  stack =[]
  expression.each do |term|
   case term
  
    # If the term is an operand, push it to stack 
    when /\d/ 
      stack.push(term)
  
    # If the term is an operator '* | \'
    when /[ \* \/ ]/
     # Pop out two operands from the stack
	 right_operand = stack.pop
	 left_operand = stack.pop
	 
	 #Check for a compound operand, left and right define the match object
	 left = /[\+ \- \* \/]/.match(left_operand)
	 right = /[\+ \- \* \/]/.match(right_operand)
	  
	 #Check precedence to minimize parentheses 
	 #if left operand is compound, check precedence of the new operator with compound one.
	 #left_par and right_par specifies whether to include parentheses or not
	 if left
	   left_par = check_precedence(term,left.to_s)
	 elsif right 
	   right_par = check_precedence(term,right.to_s)
	 end  
	
	 #If parentheses are required:
	 if left_par || right_par
      	#Place parentheses around the compound operands
  		left_operand = "(" + left_operand + ")"  if left
		right_operand =  "(" + right_operand + ")" if right 
     end
    
	 #Form a value by combining the left and right operand with operator in the middle
	 val = left_operand + term + right_operand
	 #Push the value to stack
	 stack.push(val) 
    
     #If operator is - or +	
    when /[\+ -]/
     # Pop the operands and form a value
     right_operand = stack.pop
     left_operand = stack.pop
	 val = left_operand + term + right_operand
     #Push to stack	 
	 stack.push(val)
   	 
    else 
     #Invalid operator
     puts "invalid operator{term}"
    end
  end
 return stack
 end
 end
 
#Input a postfix expression
exp = ARGV
parts = exp[0].split(" ")
c = Postfix_to_Infix.new
infix = c.parse(parts)
puts infix

 