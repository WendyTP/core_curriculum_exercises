=begin
input: a string of words (separated by spaces)
output: a hash (key: size of word; value: number of occurence)
rules:
  - write a method takes a string with words seprated by space, and 
    return a hash.
  - words consist any characters other than space
  - empty string returns empty hash
data: array and hash
algorithm:
  - set a hash variable (counting_result) as empty hash
  - split the string by space => string_array
  - counter(index) = 0
  - loop over string_array
    - if key(size) exist in the hash
        key(size) += 1
    - else
      create the key with value 1
  return counting_result       
=end



# much consise way
=begin
def word_sizes(sentence)
  result_hash = Hash.new(0)
  sentence.split.each do |word|
    result_hash[word.size] += 1
  end
  result_hash  
end
=end

# another way
def word_sizes(sentence)
  result = sentence.split.each_with_object({}) do |word,hash|
    if hash.has_key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end  
  result
end  

# first attempt
=begin
def word_sizes(sentence)
  return {} if sentence.size == 0
  counting_result ={}
  splited_sentence = sentence.split
  counter = 0
  loop do
    current_word_size = splited_sentence[counter].size
    if counting_result.has_key?(current_word_size)
      counting_result[current_word_size] += 1
    else
      counting_result[current_word_size] = 1
    end
    counter += 1
    break if counter == splited_sentence.size
  end
  counting_result
end
=end

p word_sizes('Four score and seven.') 
p word_sizes('Hey diddle diddle, the cat and the fiddle!') 
p word_sizes("What's up doc?") 
p word_sizes('') 



