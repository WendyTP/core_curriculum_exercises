=begin
input: one number 
output: result of squaring the given number
rules:
  - use the multiply method from previous exercise as base
  - returns the result
data: number
=end

def multiply(number1, number2)
  number1 * number2
end

def square(number)
  multiply(number,number)
end

p square(5)
puts square(-8)

def cube(n)
  multiply(multiply(n,n),n)
end
p cube(3)

# power function
def powered(n)
  i = n.abs
  res = n
  while i > 1
    res = multiply(res,n)
    i = i - 1
  end
  return res
end

def power(n)    # power to the n 
  if n >= 0
    multiply(n,n) * (n ** (n-2).abs)
  else 
    multiply(n,n) * (n ** (n-2))
  end
end
 
# test of power function
for i in [-3, -2, -1, 0, 1, 2, 3, 4, 5]
  p "power " + i.to_s + " = " + powered(i).to_s + " vs " + power(i).to_s
end

p power(5)
p power(4)
p power(-3)
p power(-1)
p power(-4)
p power(-5)
p power(-2)

# negative exponents ==> b ** -n = (1/ b** n)
=begin
def tester(function_name_list, number_range)
  for function in function_name_list
    for i in number_range 
      function(i)
    end
  end 

function_list = [ power, cube, square]
number_list = [-3, -2, -1, 0, 1, 2, 3, 4, 5]
tester(function_list,number_list)

=end