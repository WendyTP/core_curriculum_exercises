=begin
input: a string of digits (with + or - or nothin in front)
output: the integer equivelance of the string digit
rules:
  - write a method without String#to_i or Integer()
  - assume input is valid
  - if string is followed by + , return postive integer; negative if -; postive if non specified
  - can use string_to_integer method from previous exercise
algorithm:
  - if a string has + or - ,select only the digits for transforming to integers
  - trasnform the digits and calcuate the integer using previous method
  - add - sign to result if there's - sign from the input string
=end


# refactor - use String#delete method
DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def transform_string_digits_to_integer(string)
  digits = string.chars.map {|char| DIGITS[char] }  # ["4","3","2"]  => [4,3,2]
  value = 0
  digits.each {|digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  non_sign_string = string.delete("+-")
  tranformed_string = transform_string_digits_to_integer(non_sign_string)
  string.start_with?("-") ? -tranformed_string : tranformed_string
end  


# another way - apply method from previous exercise
=begin
DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def transform_string_digits_to_integer(string)
  digits = string.chars.map {|char| DIGITS[char] }  # ["4","3","2"]  => [4,3,2]
  value = 0
  digits.each {|digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when "+" then transform_string_digits_to_integer(string[1..])
  when "-" then -transform_string_digits_to_integer(string[1..])
  else          transform_string_digits_to_integer(string)
  end
end
=end


# first attempt
=begin
DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" =>3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def string_to_signed_integer(string)
  if string.start_with?("+","-")
    digits = string[1..].chars.map {|char| DIGITS[char]}
  else
    digits = string.chars.map {|char| DIGITS[char]}
  end

  value = 0
  digits.each {|digit| value = 10 * value + digit}
  string.start_with?("-") ? -value : value
end
=end

puts string_to_signed_integer("4321")
puts string_to_signed_integer("-570")
puts string_to_signed_integer("+100")