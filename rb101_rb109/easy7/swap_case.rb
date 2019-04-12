=begin
request: Write a method that takes a string as an argument and 
returns a new string in which every uppercase letter is replaced by its lowercase version,
 and every lowercase letter by its uppercase version. 
 All other characters should be unchanged.
rules: 
  - not use  String#swapcase
  - return a new string
data: array and string
algorithm:
  - call the .split method on the given string, to transform the string to array
  - call the .map method on this new array, passing in a block as argument
    - pass each element (small piece of string) of this array to the block
      -  call the .chars on each element (small piece of string), 
        - to return an array with each char
        - call .map method on each inner array
          - iterate through each char
            - if char is within alphabets
                - change lowercase to upcase 
                - change upcase to lowercase
            - if char is not alphabets
                - return the char unchaged
          - call .join method on the inner array, to transform the array back to string
          - assign the trasnsformed string to a local variable (swap_chars)
          - return the local variable (swap_chars) back to first map method
  - assign the new outer array to a local variable (swap_cases)
  - return swap_cases              
=end
def swapcase(str)
  swap_case = str.split.map do |inner_str|
    swap_chars = inner_str.chars.map do |char|   #["c", "b","a"]  => "cba"
      if /[a-z]/.match?(char)
        char.upcase
      elsif /[A-Z]/.match?(char)
        char.downcase
      else
        char
      end
    end
    swap_chars.join
  end
  swap_case.join(" ")
end

st = "CamEra"
p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV') 
p swapcase(st)
puts st