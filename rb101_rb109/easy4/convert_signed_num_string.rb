=begin
input: an integer (with or without -)
output: a string rep of the given integer with + or - symbol 
  ex. 4321 => "+4321" ; -500 => "-500"; 0 => "0"
rules:
  - write a method to return a string rep of given integer, with + or - symbol added
  - assume input integer is valid (negative int, 0, positve int)
  - can not use Ruby standard conversion method
  - can apply method from previous exercise
data: integer
algorithm:
  - transform given integer to its absolute value
  - apply integer_to_string method to get string rep of the integer
  - if original integer < 0 , add "-" to the result
  - if > 0, add "-" to the result
  - if == 0, no change
  - return result
=end


# another way - use <=>
DIGITS = ["0","1","2","3","4","5","6","7","8","9"]

def integer_to_string(number)
  result = ""
  loop do
    number,remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when +1 then "+#{integer_to_string(number)}"
  when -1 then "-#{integer_to_string(-number)}"
  else             integer_to_string(number)
  end
end
      

# first attempt
=begin
DIGITS = ["0","1","2","3","4","5","6","7","8","9"]

def integer_to_string(number)
  result = ""
  loop do
    number,remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  string_rep = integer_to_string(number.abs)
  if number > 0
    string_rep.prepend("+")
  elsif number < 0
    string_rep.prepend("-")
  end
  string_rep
end
=end

p signed_integer_to_string(4321)
p signed_integer_to_string(-123)
p signed_integer_to_string(0)