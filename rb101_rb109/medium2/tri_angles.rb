=begin
input: 3 integers, specified in degrees
output: returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.
rules:
  -To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
  and all angles must be greater than 0

=end

# first attempt

def valid_triangle?(arr_of_angles)
  arr_of_angles.inject(:+) == 180 &&
  arr_of_angles.all? {|ang| ang > 0}
end

def triangle(ang1, ang2, ang3)
  arr = [ang1, ang2, ang3]
  case
  when !valid_triangle?(arr)  
    :invalid
  when arr.include?(90)
    :right
  when arr.any? {|ang| ang > 90}
    :obtuse
  else
    :acute
  end
end

# another solution
=begin
def triangle(ang1, ang2, ang3)
  arr = [ang1, ang2, ang3]
  case
  when arr.reduce(:+) != 180, arr.include?(0)  # when one of the two condition is met, then :invalid is executed
    :invalid
  when arr.include?(90)
    :right
  when arr.any? {|ang| ang > 90}
    :obtuse
  else
    :acute
  end
end
=end
puts triangle(60, 70, 50) 
puts triangle(30, 90, 60)
puts triangle(120, 50, 10)
puts triangle(0, 90, 90)
puts triangle(50, 50, 50)