=begin
input: two numbers (integer or float)
output: multiplication of the given two numbers
rules:
  - input need to be numbers  (integer, 0, float)
  - create a method
  - returns the result of multiplication
data: numbers
=end

def multiply(number1, number2)
  number1 * number2
end

 p multiply([3,3],2)  # => returns [3,3,3,3]. The multiplication increases the size of the array.