=begin
input: 3 integers
output: a symbol
rules:
  - Takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
  depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
  - To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, 
    and all sides must have lengths greater than 0
algorithm:
  - valid triangle:
    - create an array with 3 arguments as items
    - check if the 3 arguments are greater than 0
    - check the sorted arguments if the addition of frist 2 items are greater than the 3 item
  - type of triangle:
    - sort the 3 arguments :
      - return equilateram if array[0] == array[1] && array[1] == array[2]
      - return isosceles if array[0] == array[1]
      - return scalene for the rest
=end
# first attempt
def valid_triangle?(arr)
  arr.all? {|n| n > 0} && arr.sort[0..1].sum > arr.sort[2]
end

def triangle(num1, num2, num3)
  arr = [num1, num2, num3]
  arr = arr.sort
  if valid_triangle?(arr)
    if arr[0] == arr[1] && arr[1] == arr[2]
      return :equilateral
    elsif arr[0] == arr[1] || arr[1] == arr[2]
      return :isosceles
    else
      :scalene
    end
  else
    :invalid
  end
end

# another soultion: use case statement
=begin
def valid_triangle?(arr)
  arr.all? {|n| n > 0} && arr.sort[0..1].sum > arr.sort[2]
end

def triangle(num1, num2, num3)
  arr =[num1, num2, num3]
  arr = arr.sort
  case
  when !valid_triangle?(arr)
    :invalid
  when arr[0] == arr[1] && arr[1] == arr[2]
    :equilateral
  when arr[0] == arr[1] || arr[1] == arr[2]
    :isosceles
  else
    :scalene
  end
end
=end

p triangle(3,3,3)
p triangle(3,3,1.5)
p triangle(3,4,5)
p triangle(0,3,3)
p triangle(3,1,1)