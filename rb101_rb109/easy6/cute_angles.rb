=begin
input: a floating point number
output: a string
rules:
  - takes a floating point number that represents an angle between 0 and 360 degrees 
  and returns a String that represents that angle in degrees, minutes and seconds
  - A degree has 60 minutes, while a minute has 60 seconds.
  - use a degree symbol (°) to represent degrees,
     a single quote (') to represent minutes, and a double quote (") 
  - use two digit numbers with leading zeros
- data : number  
=end

# first attempt -- work for both positive and negative floats
DEGREE = "\xC2\xB0"

def angles(num)
degree = num.to_i
if degree == 0
  raw_min = 0
else    
  raw_min = (num - degree) * 60
end  
minute = raw_min.to_i
raw_sec = (raw_min - minute) * 60
second = raw_sec.to_i
format(%(#{degree}#{DEGREE}%02d'%02d"), minute, second)
end



puts angles(30)
puts angles(76.73)
puts angles(254.6)
p angles(93.034773)
p angles(0) 
p angles(360) == %(360°00'00") || angles(360) == %(0°00'00")
p angles(-360)