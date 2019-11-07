=begin
requirement:
  count the occurences of each word in the given phrase
  punctuation and quotation don't count
  quotation and apostrophe count into a the combined word
  apostrophes count
  number counts as a word
  all lowercase
  class Phrase
  def initialize(word)
  def word_count
data : hash and array of words
algorithm:
    - 
  - split the string into array:
    - replace all punctuation with space
    - split words by space
    - iterare through each word
      - if word has quotation, delete them

  - counts = {}
  - iterate through the array of words
    - if word(case insentitive) exisit has counts key
        add value to this key
      otherwise create this key and value =1
  - return the hash counts
=end


class Phrase
  attr_reader :lowered_Case_sentence

  def initialize(sentence)
    @lowered_Case_sentence = sentence.downcase
  end

  def word_count
    words = clean_up_sentence(lowered_Case_sentence)
    counts = {}
    words.each do |word|
      if counts.key?(word)
        counts[word] += 1
      else
        counts[word] = 1
      end
    end
    counts
  end

  private

  def clean_up_sentence(string)
    new_str = remove_punctuations(string)
    words = new_str.split(" ")
    words.map do |word|
      remove_quotations(word)
    end
  end

  def remove_punctuations(string)
    string.gsub(/[^\d\w\s'"]/, " ")
  end

  def remove_quotations(string)
    if string.start_with?("'")
      string.delete("'")
    elsif string.start_with?('"')
      string.delete('"')
    else
      string
    end
  end
end

p Phrase.new("Louis' classroom").word_count
p Phrase.new("3d").word_count