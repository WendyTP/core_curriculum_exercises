=begin
input: a string
output: return a string, converting the alpabetic number into numeric
data: array 
algorithm:
initiate a constant, assign it ["zero", "one"...]
convert the given string into an array
iterate through the array (use map)
check if each element matches to the ele in the constant;
  if yes, reassign the element with the string form of index of the 
    constant ele
  if not, return element
assign the returned array from map method to a variable ;
convert this varialbe to a string and print it
=end

# first attempt
ALPHABETS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

def digiting_word(word)
  ALPHABETS.each do |alphabet|
    if word.downcase.include?(alphabet)
      word = word.gsub(/^\w+/,ALPHABETS.index(alphabet).to_s)
    end
  end
  word
end

def word_to_digit(str)
  result = str.split.map do |sub_str|
    digiting_word(sub_str)
  end
   
  result.join(" ")
end


# another solution - taking into account not to transform "freight" to "fr8" using /\b/
# string#gsub sub all the matching words in the given string
=begin
def word_to_digit(words)
  ALPHABETS.each do |alphabet|
    words = words.gsub(/\b#{alphabet}\b/, ALPHABETS.index(alphabet).to_s)
  end
  words
end
=end

long_sentence = 'Please call me at stfive five five five one two three four. Thanks.'
puts word_to_digit(long_sentence)
puts long_sentence






