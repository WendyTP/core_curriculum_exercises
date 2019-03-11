=begin
input: one string
output: return true or false
rules:
  - return true if given string is palindrome;
  - return false otherwise
  - palindrome reads the same forward and backward
  - case insensitive
    ex. Madam == madaM
  - ignore all non alphanumeric characters  
    ex. madam i'm adam == madamimadam
data: string
algorithm:
  - delete the spaces of given string and put all 
  lower cases, and reverse the string
  - save the result in a variable (backwad_string)
  - compare the original string(lowercase) to
  the backward_string
  - return true if it's palindrome
=end

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.gsub(/\W/,"")
  palindrome?(string)
end

p real_palindrome?('madam')
p real_palindrome?('Madam')
p real_palindrome?("Madam, I'm Adam")
p real_palindrome?('356653')
p real_palindrome?('356a653')
p real_palindrome?('123ab321')
