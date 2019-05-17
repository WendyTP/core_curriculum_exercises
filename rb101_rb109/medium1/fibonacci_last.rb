=begin
compute a method that returns the last digit of the nth Fibonacci number.
=end

# first attempt
def fibonacci(nth)
  return 1 if nth < 3
  sequence = [0,1,1]
  3.upto(nth) do |index|
    sequence[index] = sequence[index -1] + sequence[index - 2]
  end
  sequence[nth]
end

def fibonacci_last(nth)
  fibonacci(nth).to_s.chars.last.to_i   # simpler fibonacci(nth).to_s.chars.last.to_i
end  


# another solution -- easier way for calculate big numbers
# consider only last digit of each fib number
=begin
def fibonacci_last(nth)
  last_2 = [1,1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end
=end

puts fibonacci_last(15)
puts fibonacci_last(16)
puts fibonacci_last(17)
puts fibonacci_last(20)
puts fibonacci_last(100)