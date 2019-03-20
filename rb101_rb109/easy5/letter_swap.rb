=begin
input: a string of word(s)
output: a string 
rules:
  - assume input is valid string contains only words and spaces
  - write a method returns a string that first and last letter of every word are swapped
  - original input stays intact
data: array
algorithm:
  - first method for transform each word:
    set an array variable (swapped_letters) = []
    split a word by letter
    insert last letter to []
    insert the rest (index 1 to -2)
    insert the first letter to the bottom of []
    join the letters and return the result

  - second method for transforming a given string
    if given_string.size < 2
      apply first method
    else
      set an array variable (swapped_string) =[]
      split the given string by word
      iterate through each word
        apply first method
        insert to []
      join the string and return the result          
=end


#first attempt -- not changing original input
def word_transformer(word)
  swapped_letters =[]
  splited_word = word.chars
  swapped_letters << splited_word[1..-2]
  swapped_letters.unshift(splited_word[-1])
  swapped_letters << splited_word[0]
  swapped_letters.flatten.join
end

def swap(sentence)
  converted = []
  for wording in sentence.split
    converted << word_transformer(wording) 
  end
  converted.join(" ")
end



require_relative 'tester'
test_list = [
  "star is good",
  "I love avocado",
  "It's my super soup"
]
tester("swap",test_list)


# another way- mutate the original input
def swap_first_last_charracters(word)
  word[0],word[-1] = word[-1], word[0]
  word
end

def swapping(phrase)
  result = phrase.split.map do |each_word|
    swap_first_last_charracters(each_word)
  end
  result.join(" ")
end

puts swapping("a")
puts swapping("Oh what a great day")