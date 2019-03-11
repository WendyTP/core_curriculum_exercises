=begin
input: one string
output: return true or false
rules:
  - return true if given string is palindrome;
  - return false otherwise
  - palindrome reads the same forward and backward
  - case , punctuation and space matter
    ex. Madam != madaM
    ex. madam i'm adam != mada m'i madam
data: string
algorithm:
if the reverse of the given string == given string
  return true   
=end

def palindrome?(string)
  string == string.reverse
end

p palindrome?('madam')
p palindrome?('Madam')
p palindrome?("madam i'm adam")
p palindrome?('356653')

def palindrome_array?(array)
  array == array.reverse
end

p palindrome_array?([4,5,7])
p palindrome_array?(["ab","cd","ab"])

def palindrome_string_array?(input)
  input == input.reverse
end

p palindrome_string_array?('Madame')
p palindrome_string_array?('356653')
p palindrome_string_array?([4,5,7])
p palindrome_string_array?(["ab","cd","ab"])