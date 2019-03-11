=begin
input: integer
output: true or false
rules:
  - return true if given integer is palindromic;
    false otherwise
data: string
algorithm:
  trasnsform the given integer from number to string, 
  and save it in a variable
  compare the string variable with the reverse version of it
=end

def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(number)
  number_to_string = number.to_s
  palindrome?(number_to_string)
end  

p palindromic_number?(34543)
p palindromic_number?(123210)
p palindromic_number?(22)
p palindromic_number?(5)