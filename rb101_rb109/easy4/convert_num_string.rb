=begin
input: an integer
output: a string rep of the given integer
rules:
  - write a method to convert the given integer to its string rep
  - given integer can be 0 or positive integer
  - can not use Ruby standard conversion method
data: use array
algorithm:
  - set an array variable (splited_digits), containing the splited digits of given integer
  - iterate through the array (splited_digits),
    - transform each digit to it's string ref
  - combine each elemenbt in the array   
=end


# another way- use Array, and Integer#divmod
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
    
# first attempt - use hash and Integer#digits method
=begin
STRING_DIGITS = {
  0 => "0", 1 => "1" , 2 => "2", 3 => "3", 4 => "4",
  5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"
}

def integer_to_string(number)
  splited_digits = number.digits.reverse
  splited_digits.map! { |digit| STRING_DIGITS[digit]}
  splited_digits.join
end
=end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(5000)

