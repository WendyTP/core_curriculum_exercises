=begin
input: a string
output: a string with odd words reversed
rules:
  - input should be  a set of words, separated one or more space, terminated by one or more space, and a point.
  - output should be a set of words, separated by one space, terminated with last word with a point.
  - words : has one till 20 letters.
example:
  1. - normal sentence
    input: "whats the matter with kansas." 
    output: "whats eht matter htiw kansas."
  2. - several spaces 
    input: "whats   the matter    with kansas."
  3.  - point separated from last word
    input: "whats the matter with kansas   ."
  4. - edge : empty string input
    output: raise error
  5.  - edge: string doesn't end with a point.
      output: raise error
      - edge: no space between words 
      output: raise error if length > 20 letters
      - edge : string with digits any non letter symbol (ex "what 7 ? to")
      output: raise error (argumenterror)
      - edge: given nil or non string
      output: raise error
data: string
algorithm:
  - validate input
  - split words by space
  - add the point to last word if last item in array is a spot
  - reverse the "even" word in the array
  - concat each word with a space, except last word with a point
=end

class OddWords
  attr_reader :sentence
  def initialize(sentence)
    @sentence = sentence
  end

  def change_odd_words(sentence)
    valid_sentence?(sentence)
    # assume input is valid ( at least a word with a point and space separated words)
    words = sentence.scan(/\b[a-zA-Z]+\b/)
    reversed_result = words.map do |word|
      words.index(word).odd? ? word.reverse : word
    end
    reversed_result[-1] += "."
    reversed_result.join(" ")
  end

  private

  def valid_sentence?(sentence)
    input_is_string?(sentence)

    split_sentence = sentence.split
    
    non_empty_string?(split_sentence)
    valid_string_input?(split_sentence)
    valid_one_word_sentence?(sentence) if split_sentence.size == 1
    sentence_end_with_point?(split_sentence)
  end

  def input_is_string?(sentence)
    raise ArgumentError, "input needs to be string" unless sentence.is_a?(String)
  end

  def valid_string_input?(words)
    result = words.all? do |word|
      word.match(/\A[a-zA-Z]+\.*|\.{1}\Z/)
    end

    raise ArgumentError, "string can only contain letters, space and point" unless result
  end

  def non_empty_string?(words)
    raise ArgumentError, "needs to provide at least one word" unless words.size > 0
  end

  def valid_one_word_sentence?(sentence)
    if sentence.size > 20
      raise ArgumentError, "word can not be longer than 20 letters"
    elsif !sentence.match?(/[a-zA-Z]/)
      raise ArgumentError, "word need to contain letters"
    elsif !sentence.end_with?(".")
      raise ArgumentError, "word need to include a point"
    end
  end

  def sentence_end_with_point?(words)
    result = (words[-1] == "." || words[-1].end_with?(".") || words[-2].end_with?("."))
    raise ArgumentError, "sentence need to end with a point" unless result
  end
end

odd = "  ."

p OddWords.new(odd).change_odd_words(odd)
