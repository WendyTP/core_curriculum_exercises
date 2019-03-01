=begin
input: 2 numbers in string form - length and width
output: display area in square meters ; area in square feet 
rule: 
1 suqare meter == 10.7639 square feet
assuming user input is valid
user input is in meters
Algorithm:
ask user for input of length
ask user for input of width
convert both inputs from string to float numbers
set a variable containing value of calculation of square meter
set a varialbe containing value of calculation of square feet
print out the result of calculation
=end

SQMETERS_TO_SQFEET = 10.7639
puts "Please enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Please enter the width of the room in meters: "
width = gets.chomp.to_f

square_meter = length * width
square_feet = square_meter * SQMETERS_TO_SQFEET

puts "The area of the room is #{square_meter.round(2)} \
square meters (#{square_feet.round(2)} square feet)."

=begin
further exploration: 
input : measurement in feet
output: display area in square feet, square inches and square centimeters
=end

SQFOOT_TO_SQINCH = 144
SQFOOT_TO_SQCENTIMETER = 929.03

puts "Please enter the length of the room in feet:"
length_feet = gets.chomp.to_f
puts "Please enter the width of the room in feet: "
width_feet = gets.chomp.to_f

square_feet = length_feet * width_feet
square_inches = square_feet * SQFOOT_TO_SQINCH
square_centimeters = square_feet * SQFOOT_TO_SQCENTIMETER

puts "The area of the room is #{square_feet.round(2)} square feet \
(#{square_inches.round(2)} square inches) \
(#{square_centimeters.round(2)} square centimeters)."