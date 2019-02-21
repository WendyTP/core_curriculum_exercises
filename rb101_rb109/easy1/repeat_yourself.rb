def prompt(message)
  puts("=> #{message}")
end

def valid_positive_integer?(number)
  /^\d+$/.match(number) && number.to_i > 0
end

def valid_string?(string)
  /./m && /\S/.match(string)
end

def repeat_yourself
  prompt("Welcome!")

  input_integer = ""
  loop do
    prompt("Please give a postive integer")
    input_integer = gets.chomp
    break if valid_positive_integer?(input_integer)
    prompt("This is not a valid number")
  end  

  input_string = ""
  loop do
    prompt("Please give a string")
    input_string = gets.chomp
    break if valid_string?(input_string)
    prompt("This is not a valid string")
  end
    
  converted_integer = input_integer.to_i
  prompt("you string will be repeated: #{converted_integer} times")
  converted_integer.times {puts input_string}
end


repeat_yourself




