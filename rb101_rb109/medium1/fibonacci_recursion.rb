=begin
Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
input: an integer
output: an integer
=end



def fibonacci(nth)
  return 1 if nth < 3
  fibonacci(nth - 1) + fibonacci(nth - 2)
end


puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(12)
puts fibonacci(20)



# example of how recursion works
=begin
def sum(n)
  return 1 if n == 1
  n + sum(n-1)
end

p sum(3)
=end