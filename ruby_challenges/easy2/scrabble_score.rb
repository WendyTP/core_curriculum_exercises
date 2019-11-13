=begin
requirement: given a word, compute the scrabble score of the word,
  based on the given letter values.
input: a string (word) -- case insensitive
output: an integer 
edge case: 
    - nil (non string) => 0
    - empty string("")  => 0
    - white space (" \t\n") => 0
data : hash
  {[a,e,i..] => 1, [d,g] => 2}
algorithm:
  - scrabble_score = 0
  - validate input (if it's string of words)
  - iterate through the letter value suites
    - count_amt = string.count(arr of letter)
    - scrabble_score += count_amt * value
  - return scrabble score
=end

class Scrabble
  LETTER_VALUES = {
    %(AEIOULNRST) => 1,
    %(DG)  => 2,
    %(BCMP) => 3,
    %(FHVWY) => 4,
    %(K) => 5,
    %(JX) => 8,
    %(QZ) => 10
  }
  attr_reader :word 
  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    scrabble_score = 0
    return scrabble_score unless valid_input?(word)
    uppercase_word = @word.upcase
    LETTER_VALUES.each do |letters, value|
      count_amt = uppercase_word.count(letters)
      scrabble_score += count_amt * value
    end

    scrabble_score
  end

  private
  
  def valid_input?(word)
    word.is_a?(String)
  end



end