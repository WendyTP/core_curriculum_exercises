=begin
request: Modify the method from the previous exercise 
so it ignores non-alphabetic characters when determining 
whether it should uppercase or lowercase each letter.
rules:
  - The non-alphabetic characters should still be included in the return value;
input: a string
output: a string
data: array
algorithm:
  - transofrm the given string into an array (str_array) (split by char)
  - create an empty string (staggered)
  - call each method on str_array 
  - at each iteration
    - if char is not letter
        - insert into staggered
    - if char is a letter
        - if the total of letters in staggered is even number
         - char.upcase and insert into staggered
        - else
          - char.downcase and insert into staggered
  - return staggered      
=end

def staggered_case(str)
  str_array = str.chars
  staggered = ""
  str_array.each do |char|
    if /[a-zA-Z]/.match?(char)
      if staggered.count("a-zA-Z").even?
        staggered << char.upcase
      else
        staggered << char.downcase
      end
    else
      staggered << char
    end
  end
  staggered
end
puts staggered_case('I Love Launch School!')
puts staggered_case('ALL CAPS')
puts staggered_case('ignore 77 the 444 numbers')
