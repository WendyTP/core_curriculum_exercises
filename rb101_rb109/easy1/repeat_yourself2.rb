# different validation and repeat method
def prompt(message)
  puts("=> #{message}")
end

def valid_positive_integer?(number)
  (number.to_i.to_s == number) && number.to_i > 0
end

def valid_string?(string)
  string.split.length > 0
end

def receive_input_integer
  input_integer = ""
  loop do
    prompt("Please give a postive integer")
    input_integer = gets.chomp
    break if valid_positive_integer?(input_integer)
    prompt("This is not a valid number")
  end
  input_integer 
end  

def receive_input_string
  input_string = ""
  loop do
    prompt("Please give a string")
    input_string = gets.chomp
    break if valid_string?(input_string)
    prompt("This is not a valid string")
  end
  input_string
end

def repeat_yourself
  prompt("Welcome!")

  converted_integer = receive_input_integer.to_i

  received_string = receive_input_string 
    
  prompt("you string will be repeated: #{converted_integer} times")
  
  while converted_integer > 0
    converted_integer -= 1
    puts received_string
  end  
end


repeat_yourself
