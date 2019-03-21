=begin
input: a string containing non-letters
output: a hash key: size of word; value: number of occurence
rules:
  - write a method that returns a hash
  - do not count non-letter word into word size
  - words do not include space
data: array
algorithm:
  - create a new empty hash with default value of 0
  - split the given string by words,
  - delete non-letter from each word
  - iterate through each word:
    - create key and add number of occurence
  - return the updated hash  
=end

# more consise
def net_word_sizes(sentence)
  result = Hash.new(0)
  sentence.split.map do |word|
    clean_word = word.delete("^A-Za-z0-9")
    result[clean_word.size] += 1
  end
  result
end    

# first attempt
=begin
def net_word_sizes(sentence)
  result = Hash.new(0)
  updated_sentence = sentence.split.map do |word|
    word.delete("^A-Za-z0-9")
  end
  updated_sentence.map do |word|
    result[word.size] += 1
  end
  result
end
=end  
puts net_word_sizes('Four score and seven.')
puts net_word_sizes('Hey diddle diddle, the cat and the fiddle!')
puts net_word_sizes("What's up doc?")
puts net_word_sizes('')