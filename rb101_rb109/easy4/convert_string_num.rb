=begin
input: a string of digit
output: an integer equivalent to the numerical value of the given string
rules:
  - create a method that trasnform a string (digit) to integer
  - assume input string is valid and no + or _ sign in front
  - method can not use String.to_i nor Integer()
algorithm:
  - create 2 methods:
  - 1st method: transform a string digit to an integer
    - return 0 if string digit == "0" 
    - return 1 if string digit == "1" .... until 9
  - 2nd method: transform a string digits to an integer
    - create an integer variable with value 0 (result_integer)
    - set a counter variable (counter) with value 0
    - set a varialbe (n_th_power_of_ten) euqivalent to (size of given string) - 1
    - while counter < string digits size
      - (apply string[counter] to first method )* (10 ** (n_th_power_of_ten - counter)
      - result_integer += the above result
      - counter  += 1
      continue until end of loop
    return result_integer  
=end


# simpler way - using hash 

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

# first attempt
=begin

def digit_to_integer(string_digit)
  case string_digit
  when "0" then 0
  when "1" then 1
  when "2" then 2
  when "3" then 3
  when "4" then 4
  when "5" then 5
  when "6" then 6
  when "7" then 7
  when "8" then 8
  when "9" then 9
  end
end

def transform_string_digits_to_integer(input_string)
  result_integer = 0
  counter = 0
  n_th_power_of_ten = (input_string.size) - 1
  while counter < input_string.size
    individual_digit = digit_to_integer(input_string[counter]) * (10 ** (n_th_power_of_ten - counter))
    result_integer += individual_digit
    counter += 1
  end
  result_integer
end
=end


puts transform_string_digits_to_integer("4321")
puts transform_string_digits_to_integer("570")
