=begin
# further exploration from "convert string to a number"
input: a string (of digit)
output: an integer
rules:
  - convert a string representing a hexadecimal number to its integer value
  - hexadecimal: it's a positional numeral system with base of 16. 
    - "0" - "9" : represent values 0 to 9 ; "A" - "F": represent values 10 to 15
    - ex: 3425h = (3 * (16 **3) + (4 * (16**2)) + (2 * (16**1)) + (5 * 1) = 13349 in decimal
=end

HEXS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, 
  "5" =>5, "6" => 6, "7" => 7, "8" => 8 , "9" => 9,
  "A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15,
  "a" => 10, "b" => 11, "c" => 12, "d" => 13, "e" => 14, "f" => 15

}

def hexadecimal_to_integer(string)
  hexs = string.chars.map {|char| HEXS[char]}
  value = 0
  hexs.each {|hex| value = 16 * value + hex}
  value
end

puts hexadecimal_to_integer("4D9f")
