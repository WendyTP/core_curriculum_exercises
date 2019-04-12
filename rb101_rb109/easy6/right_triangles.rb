=begin
request: Write a method that takes a positive integer, n, as an argument, 
and displays a right triangle whose sides each have n stars
rules: 
  - The hypotenuse of the triangle (the diagonal side in the images below) 
  should have one end at the lower-left of the triangle, and the other end at the upper-right.
algorithm:
  - set a counter = 1
  - while counter <= given argument
    - empty_space = " "
    - star = "*"
    - line = empty_space * (given_argument-counter) + star * counter
    - puts line
    - counter += 1  
=end

def triangle(n)
  counter = 1
  while counter <= n
    empty_space = " "
    star = "*"
    line = (empty_space * (n - counter)) + (star * counter)
    puts line
    counter += 1
  end
end

p triangle(5)
puts triangle(9)