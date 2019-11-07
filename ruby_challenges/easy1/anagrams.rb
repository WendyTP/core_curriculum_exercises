=begin
requirement: Write a program that, given a word and a list of possible anagrams,
 selects the correct sublist that contains the anagrams of the word
anagram: 
  - exact amount of letter
  - exact same letters are used
  - case insensitive
  - can not be identical word (ie. same word)

 class Anagram
  def initialize(a word)
  def match (an array of words)
data: array of letters
algorithm:
    - check each word against given word:
      - split given word into an array of letters, and case insensitive, and sort
      - split check-word into an array of letters, and case insensitive, and sort
      - compare if both sets are the same
        - if not, return false
        - if yes, check original check-word(case insensitivve) if the same as original word(case insensitive)
            - return false if yes
        - return true
    - check an array of words
        - iterate through given array, select the one which block return true
=end

class Anagram
  attr_reader :given_word
  def initialize(given_word)
    @given_word = given_word
  end

  def match(array_of_words)
    array_of_words.select do |word|
      anagram_word?(word)
    end
  end

  private
  
  def anagram_word?(check_word)
    given_word_sorted_letters = word_to_sorted_letters(given_word)
    check_word_sorted_letters = word_to_sorted_letters(check_word)
    return false if given_word_sorted_letters != check_word_sorted_letters
    given_word.casecmp(check_word) == 0 ? false : true
  end 

  def word_to_sorted_letters(word)
    word.chars.map(&:downcase).sort
  end
end
