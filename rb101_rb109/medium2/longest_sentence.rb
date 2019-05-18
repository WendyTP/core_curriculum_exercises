=begin
input: a text file
output: 1. print the longest sentence from the given file
        2. print the number of words in the longest sentence
rules:
  1. Sentences may end with periods (.), exclamation points (!), or question marks (?).
  2. Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word
algorithm:
  - create sentence whilst keeping the ending chars.
  - create another sentence, and compare the two. 
    - Replace the main with the 2nd sentence if 2nd size > main
    - otherwise, repace 2nd sen with another new sen, and continue the comparison with main
    - return main sentence
=end

def create_sentence!(sentences)
  new_sentence = []
  loop do
    new_sentence << sentences.shift
    break if new_sentence.last.end_with?(".", "?", "!")
  end  
  new_sentence
end

def longest_sentence(text)
  splited_text = text.split
  main_sentence = create_sentence!(splited_text)  # array
  compared_sentence = []
  until splited_text.size == 0
    compared_sentence = create_sentence!(splited_text)  # array
    if compared_sentence.size > main_sentence.size
      main_sentence = compared_sentence
    end
  end
  main_sentence.join(" ")
end  

def words_count(text)
  longest_sentence(text).split.size
end


long_text = File.read("sample_text_for_longest_exercise.txt")

p longest_sentence(long_text)
puts "The longest sentence contains #{words_count(long_text)} words." 


# another solution -- though the ending "." is not printed
=begin
sentences = long_text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
=end