=begin
input: a string
output: an integer (the ASCII string value)
rules:
  - write a method that returns the ASCII string value of the given string.
  - assume input is valid string or empty string
  - ASCII string value is the sum of the ASCII values of every char in the string
  - can use String#ord for determing the ASCII value of a character.
  - ASCII : it is a 7-bit character set containing 128 characters. 
    - It contains number 0-9; upper case A-Z ; lower case A-Z, and special symbol
  - return 0 for empty string  
  data: array
  algorithm:
    - return 0 if input is an empty string
    - split each char of the given string (including space and symbols)
    - set a variable (total_sum) = 0
    - iterate through the string array
      - count value of each character 
      - add the value to total_sum
    return total_sum  
=end

def ascii_value(string)
  return 0 if string.size == 0
  total_sum = 0
  string.chars.each do |char|
    total_sum += char.ord
  end
  total_sum
end

p ascii_value("Four score")
p ascii_value("Launch School")
p ascii_value("a")
p ascii_value("")


# further exploration
=begin
char.ord.chr =>  char
example:
"w".ord => 119 
"w".ord.chr => "w"

if char contains more than one character, the Integer#chr method will count only the first character.
ex: "st".ord.chr => "s"
=end