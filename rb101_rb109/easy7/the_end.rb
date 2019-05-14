=begin
input: a string contains at least 2 words
output: a string whihc is the last 2nd word from the input string
rules: input string  contains words that are non blank char.
=end

# first attempt
def penultimate(str)
  str.split[-2]
end

p penultimate('last word')  #=> "last"
p penultimate('Launch School is great!') #=> "is"


=begin
# further exploration
edge cases: 
string contains 1 word
string contains 0 word
string contains even words  --> return both words in the middle

# write a method that returns the middle word/phrase of the given string

def penultimate(str)
  arr = str.split

    return "No middle word available in the given string." if arr.size <= 2

    middle_index = (arr.size) / 2

    if arr.size.even?
      return "The first middle word is #{arr[middle_index-1]}, and the second middle world is #{arr[middle_index]}"
    else
    arr[middle_index]
    end
end

p penultimate("")
p penultimate("word")
p penultimate('last word') 
p penultimate('last word is great')  #=> "is great"
p penultimate('Launch School is really great!') #=> "is"
=end