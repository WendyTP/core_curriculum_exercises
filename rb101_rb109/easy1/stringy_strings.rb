=begin
input: a positive integer (argument is valid)
output: a string consists of 0 and 1 (1010...)
rules: 
always start with 1; 
length of the output string == length of
given integer
algorithm:
=end

# further exploration
def strings(number, ops=1)
  string = ""
  number.times do |index|
    if ops == 0
      letter = index.even? ? "0" : "1"
    else
      letter = index.even? ? "1" : "0"
    end
  string = string + letter
  end
  
  string
end

puts strings(5,0)
puts strings(5,1)
puts strings(2,0)
puts strings(2,1)

# improvement
def stringy_string(number)
  string = ""
  number.times do |index|
    letter = index.even? ? "1" : "0"
    string = string + letter
  end
string
end

puts stringy_string(6)
puts stringy_string(3)

# first attempt
def stringy(number)
  string = ""
  while number > 0
    string = string + "1"
    number -= 1
    break if number == 0
    string = string + "0"
    number -= 1
  end
  string
end

puts stringy(6)
puts stringy(9)
puts stringy(4)
puts stringy(7)


