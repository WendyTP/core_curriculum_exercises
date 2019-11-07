=begin
requirement: calculate the Hamming distance between 2 DNA strands
Hamming distance: 
  - defined for sequences of equal length
  - unequal length: check only the shorter length
  - the total amt of letter difference.
class DNA
  def initialize(given strand->a string, can be empty)
  def hamming_distance(check_strand, can be empty string)
data: array
algorithm:
  - split both strands to array of letters
  - counter = 0
  - set the checking length 
    - checking length to be the shorter 
  - slice both strands to shorter length
  - compare the sliced strands 
  - return counter
=end

class DNA
  attr_reader :given_letters, :check_letters
  def initialize(given_string)
    @given_letters = given_string.chars
  end

  def hamming_distance(check_word)
    @check_letters = check_word.chars
    check_length = determine_check_length(given_letters, check_letters)
    counter = 0
    given_letters.clone.slice(0,check_length).each_with_index do |letter, idx|
      counter += 1 if letter != check_letters[idx]
    end
    counter
  end

  private 

  def determine_check_length(given_letters, check_letters)
    check_length = (given_letters.size <= check_letters.size) ? given_letters.size : check_letters.size
  end
end

