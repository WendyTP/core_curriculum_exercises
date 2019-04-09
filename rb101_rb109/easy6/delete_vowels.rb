=begin
request: Write a method that takes an array of strings, and returns an array of the same string values,
 except with the vowels (a, e, i, o, u) removed.
input: an array of string
output: an array of same string, without vowels
rules: 
  - assume input is valid -- strings in array
  - not mutate the original array
data: array
algorithm:
  - iterate through each element in the array
  - in each element, if there's [a,e,i,o,u] in it, substitue with ""
  - return each updated element to the array
  - return the array
=end

def remove_vowels(array_strings)
  array_strings.map do |string|
    string.gsub(/[aeiouAEIOU]/,"")
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))
p remove_vowels(%w(green YELLOW black white))
p remove_vowels(%w(ABC AEIOU XYZ)) 