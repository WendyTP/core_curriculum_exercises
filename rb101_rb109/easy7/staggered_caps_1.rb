=begin
request:Write a method that takes a String as an argument, 
and returns a new String that contains the original value using a staggered capitalization scheme 
in which every other character is capitalized, and the remaining characters are lowercase
rules:
  - Characters that are not letters (space, symbols) should not be changed,
  -  but count as characters when switching between upper and lowercase.
  - the first char of the string is uppercase
input: a string
output: a new string
data: array
algorithm-- didn't work:
  - call .chars method onto the given string --> new array
  - call .map method onto the new array, passing a block as arg.
    - at each iteration:
      - if the index of char is a even num  -- bug here! 
          - change to upcase if the char is a letter
          - return the char as it is
      - if the index of char is an odd num
          - change to lowercase if the char is a letter
          - reutrn the char as it is
  - assign the updated new array to a local variable (staggered_cases)
  - call the .join method (sperate by space) on to staggerd_cases
  - return the staggered_cases
=end

# works
def staggered_case(str)
  str_array = str.chars
  counter = 0
  staggered =[]
  while counter < str_array.length
    if counter.even?
      staggered << str_array[counter].upcase
    else
      staggered << str_array[counter].downcase
    end
    counter += 1
  end
  staggered.join(" ")
end

=begin
# bug
def staggered_case(str)
  str_array = str.chars
  staggered_cases = str_array.map do |char|
    if str_array.index(char).even?  # bug -- if the same char exist before, it will use that char's index
      if /[a-zA-Z]/.match?(char)
        char.upcase
      else
        char
      end
    else
      if /[a-zA-Z]/.match?(char)
        char.downcase
      else
        char
      end
    end
  end
  staggered_cases.join(" ")
end
=end

  

puts staggered_case('I Love Launch School!')
puts staggered_case('ALL_CAPS')
puts staggered_case('ignore 77 the 444 numbers')
