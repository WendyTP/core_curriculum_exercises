=begin
request: Write a method that calculates and returns the index of the first Fibonacci number 
that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)
input: an integer greater than or equal to 2
output: an integer (representing the index of the fibonacci number specified)
rules:
  - assume the argument is always greater than or equal to 2.
  - The first Fibonacci number has index 1.)
algorithm:
  - a way to create an array of fibonacci numbers
    - fibonacci = [1,1]
      counter = 2
      loop do 
      fibonacci[counter] = fibonacci[counter- 1] + fibonacci[counter - 2]
      break if xxx
      end

  - whilst creating the array, check at the same time:
    - if the created number matches to the argument condition, 
      - save the index of this number into a variable
      - variable += 1 
      - return this variable 
=end

# first attempt
def find_fibonacci_index_by_length(number_of_digits)
  fibonacci = [1,1]
  counter = 2
  loop do 
    fibonacci[counter] = fibonacci[counter- 1] + fibonacci[counter - 2]
    if fibonacci[counter].digits.count == number_of_digits
      counter += 1
      break
    end
    counter += 1  
  end
  counter
end


# possible solution - using integer and a index counter counting on the side
=begin
def find_fibonacci_index_by_length(number_of_digits)
  first = 1
  second = 1
  index = 2
  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_of_digits

    first = second
    second = fibonacci
  end
  index
end    
=end

puts find_fibonacci_index_by_length(2)
puts find_fibonacci_index_by_length(3) 
puts find_fibonacci_index_by_length(10)
puts find_fibonacci_index_by_length(100) 
puts find_fibonacci_index_by_length(1000) 

