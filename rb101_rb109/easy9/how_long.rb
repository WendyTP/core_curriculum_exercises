=begin
input: a string
output: return an array contains every word from the string, to which you have appended a space and the word length.
rules: assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word
=end

def word_lengths(str)
  arr = str.split
  return arr if arr.size == 0
  arr.map do |sub_str|
    sub_str << " #{sub_str.size}"
  end  
end


# another solution
=begin
def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end
=end

long_str = "cow sheep chicken"
p word_lengths(long_str)

#p word_lengths("baseball hot dogs and apple pie")

#p word_lengths("It ain't easy, is it?")

#p word_lengths("Supercalifragilisticexpialidocious")

#p word_lengths("") == []

p long_str

