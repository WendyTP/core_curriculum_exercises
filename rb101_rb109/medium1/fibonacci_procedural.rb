=begin
Rewrite your recursive fibonacci method so that it computes its results without recursion.

=end

# first attempt

def fibonacci(nth)
  return 1 if nth < 3
  sequence = [0,1,1]
  
  counter = 3
  loop do
    sequence[counter] = sequence[counter - 1] + sequence[counter - 2]
    counter += 1
    break if counter > nth
  end
  sequence[nth]
end


# another solution - simpler
=begin
def fibonacci(nth)
  first,last =[1,1]
  3.upto(nth) do
    first,last = [last, first + last]
  end

  last
end
=end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(12)
puts fibonacci(20)
#puts fibonacci(100)