=begin
input: a positve integer bigger than 0
output: an integer
rules:
  - write a method
  - given a range of numbers from 1 to n, 
    choose numbers of multiples of 3 or 5
  - return the sum of the chosen number  
data: array
algorithm:
  - create an array (total_numbers) containing numbers from 1 to input
  - create a variable (chosen_numbers) for an empty array
  - iterate through numbers:
    - insert number into chosen_numbers if it's multiple of 3 or 5
  - sum up the chosen numbers and return the value
=end

def multisum(input_number)
  total_numbers = (1..input_number).to_a
  chosen_numbers = []
  total_numbers.each do |number|
    chosen_numbers << number if (number % 3 == 0 || number % 5 == 0)
  end  
  chosen_numbers.inject(:+)
end


# split method into two and use Integer#upto method
=begin
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(input_number)
  chosen_numbers =[]
  1.upto(input_number) do |num|
    chosen_numbers << num if multiple?(num,3) || multiple?(num,5)
  end
  chosen_numbers.inject {|sum,n| sum + n}
end    
=end


def testing(test_examples)
  test_examples.each do |example|
    puts multisum(example)
  end
end

testing([3,5,10,1000])