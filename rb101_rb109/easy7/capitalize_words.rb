=begin
Request: rite a method that takes a single String argument and returns a new string 
that contains the original value of the argument with the first character of every word 
capitalized and all other letters lowercase.
rules:
  - return a new string
  - assume that words are any sequence of non-blank characters.
input: a string (with small string sequences separated by space)
output: a new string containing the same small strings but 
  with each first chars capitalizd, and the rest lowercase
data: array
algorithm:
  - transform this string into an array, separated by space
  - apply Enumerable#map method on to the array
  - at each iteration of a piece of string
    - lowercase every char of string, and capitalize the first index
    of this piece of string
  - assign the return value of map method to a local variable
    (capitalized_words)
  - transform this array (assigned with local varialbe capitalized_word),
  back to string, and return it to the method. 
=end

def word_cap(str)
  capitalized_words = str.split.map do |inner_string|
    inner_string.downcase.capitalize
  end
  capitalized_words.join(" ")
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
puts word_cap('this is a "quoted" word')