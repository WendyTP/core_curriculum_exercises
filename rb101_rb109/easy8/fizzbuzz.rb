=begin
input: 2 arg of a starting num; ending num
output: print out all numbers between these 2 num
rules: assume input is valid
=end

# first attempt
def fizzbuzz(start_num, end_num)
  result = []
  (start_num..end_num).each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5  == 0
      result << "Buzz"
    else
      result << num
    end
  end
  puts result.join(", ")
end

# another solution - split methods
=begin
def fizzbuzz_value(num)
  if num % 3 == 0 && num % 5  == 0
    "FizzBuzz"
  elsif num % 3 == 0
    "Fizz"
  elsif num % 5 == 0
    "Buzz"
  else
    num
  end
end

def fizzbuzz(start_num, end_num)
  result = []
  (start_num..end_num).each do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(", ")
end
=end

fizzbuzz(1,15)