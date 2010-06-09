=begin
   Author: Charu Jain
   Prework:Secret Santa
   Description:
   Usage: cat names.txt | ruby santa.rb (names.txt contains the person's information)

=end

@first = Array.new
@last  = Array.new
@email_add  = Array.new

#Regex to extract first name,last_name and email address
re  = /([A-Z][a-z]+) ([A-Z][a-z]+) <([a-z]+@[a-z]+.+)>/

@count = 0

ARGF.each do |b|
    info = re.match(b.chomp)
    @first.push(info[1])
    @last.push(info[2])
    @email_add.push(info[3])
    @count+=1
end

@secret_santa = Array.new
@is_santa     = Array.new(@count)

def find_santa(name,index) 
  santa =[]
  has_santa = 'no'
  has_checked = Array.new
  while has_santa == 'no'
    ind = rand(@count)
    has_checked[ind] = 1
    i = @first[ind]
    if @is_santa[ind]!= 1  
        unless @last[@first.index(i)]==@last[index]
           santa = i + " " + @last[@first.index(i)] 
           @secret_santa.push(santa)
           has_santa = 'yes'
           @is_santa[ind] = 1
        end
     end
   end
return 
end    

@first.each_with_index do |name,index| 
  find_santa(name,index)
end

# Print the results
i = 0 
while (i < @count)
  puts @first[i] + @last[i]+ "---" + @secret_santa[i]
  i+=1
end