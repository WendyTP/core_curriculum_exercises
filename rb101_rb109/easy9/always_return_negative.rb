=begin
input: a number
output: returns a number 
rules: change positive number to negative 
algorithm:
check if given num is greater than 0. if yes, return positive form of it
if not, return the given num
=end

# first attempt
def negative(number)
  if number > 0
    -number
  else
    number
  end
end

# another solution- ternary
=begin
def negative(number)
  #number > 0 ? -number : number
  -number.abs
end  
=end

puts negative(5)
puts negative(-3)
puts negative(0)