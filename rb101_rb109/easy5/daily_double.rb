=begin
input: a string
output: a new string  contains the value of the original string with all consecutive 
  duplicate characters collapsed into a single character. 
rules:
  - write a method return a new string
  - can not use Sting#squeez(!)
  - empty string returns empty string
data: array
algorithm:
  - create an array of the given string (separated by chars)
  - set a counter (index) = 0
  - loop through the array
    - set current_check_letter = counter letter
    - set inner_counter = counter + 1
    - small loop
    - if curren_check_letter == inner_counter letter
        delete inner_counter_letter
      break if current_check_letter != inner_counter letter
  - return the array.join  
=end


# much simpler way -- using string directly, and instead of insert first consecutuve letter, insert the last consecutive letter

def crunch(sentence)
  clean_sentence = ""
  index = 0
  while index < sentence.length
    clean_sentence << sentence[index] if sentence[index] != sentence[index+1]
    index += 1
  end
  clean_sentence
end    



# first attempt -- change to array and use loops
=begin
def crunch(sentence)
  return "" if sentence.size == 0
  clean_sentence = sentence.chars
  counter = 0
  loop do
    current_check_letter = clean_sentence[counter]
    inner_counter = counter + 1
    loop do
      break unless current_check_letter == clean_sentence[inner_counter]
      clean_sentence.delete_at(inner_counter)
      break if clean_sentence.size == 1
    end
    counter += 1
    break if counter == clean_sentence.size
  end
  clean_sentence.join
end
=end

# another way- use String#chars but simplify
=begin
def crunch(sentence)
  clean_sentence = Array.new(0)
  sentence_array = sentence.chars
  
  index = 0
  while index <= sentence_array.length
    clean_sentence << sentence_array[index] if sentence_array[index] != sentence_array[index+1]
    index += 1
  end
  clean_sentence.join
end
=end

# another way- use regular expression
=begin
def crunch(sentence)
  sentence.gsub(/(.)(?=\1)/,'')
end  
=end


p crunch('ddaaiillyy ddoouubbllee') 
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('') 