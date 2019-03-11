=begin
input: user input 5 integers , one at a time
output: a string message with the 6th number and an array of the first 5 numbers
rules:
  - ensure user input is integer (validate)
data: integer and array
algorithm:
  - set a variable number_array  for an empty array
  - print a message to request user input an integer
  - validate user input (repeat the question until user input is correct)
  - transform user input from string to integer
  - insert the number into number_array
  - repeat the same process for another 4 times, until there are 5 numbers in number_array
  - request for the 6th number & validate it
  - transform the 6th number and save it in an variable last_number
  - check if last_number appears in the number_array
    - if yes, puts "The number x appears in [xxxx]"
    - if not, puts "The number x does not appear in [xxxxx]"   
=end

def prompt(message)
  puts "==> #{message}"
end

def counting_number(num)
  case num
    when 1 then "1st"  
    when 2 then "2nd"
    when 3 then "3rd"
    when 6 then "last"  
    else "#{num}th"
  end
end

def is_valid?(input_number)
  /^\d+$/.match(input_number)
end

def receive_user_input(number)
  input_number = nil
  loop do
    prompt("Enter the #{counting_number(number)} number:" )
    input_number = gets.chomp
    break if is_valid?(input_number)
    prompt("The number given is not valid!")
  end
  input_number
end  

 
number_array = []
number = 1
while number < 6
  validated_number = receive_user_input(number).to_i
  number_array << validated_number
  number += 1
end

num = 6
last_validated_number = receive_user_input(number).to_i

if number_array.include?(last_validated_number)
  prompt("The number #{last_validated_number} appears in #{number_array}")
else
  prompt("The number #{last_validated_number} does not appears in #{number_array}")
end





