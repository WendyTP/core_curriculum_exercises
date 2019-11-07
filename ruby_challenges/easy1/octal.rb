=begin
requirement:
  -Given an octal input string, your program should produce a decimal output.
  - invalid input returns integ. 0
class Octal
  def initialize(string int)
  def to_decimal
end
input: a string of integers (invalid input is acceptable)
output: an "integer" representing octal number
method imp: 
  - validate input 
    -if valid do the transoformation
    - otherwise return 0
  - transformation
      - turun string into array of integers
      - transform each integer to octal num
      - add up all the nums and return the result
=end

class Octal
  BASE = 8
  attr_reader :string_of_integer
  def initialize(string_of_integer)
    raise ArgumentError, "must provide a string" unless string_of_integer.is_a?(String)
    @string_of_integer = string_of_integer
  end

  def to_decimal
    return 0 unless valid_input_for_octal?

    numbers= string_to_integers

    transfomred_numbers = []

    numbers.reverse.each_with_index do |num, idx|
      transfomred_numbers << num * (BASE ** idx)
    end

    transfomred_numbers.reduce(&:+)
  end

  private

  def valid_input_for_octal?
    string_of_integer.match?(/\A[0-7]+\z/)
  end

  def string_to_integers
    string_of_integer.chars.map(&:to_i)
  end
end

oct = Octal.new("7777")
p oct.to_decimal