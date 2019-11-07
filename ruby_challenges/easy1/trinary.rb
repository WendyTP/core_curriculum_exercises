=begin
requirment:
  -convert a string of trinary number to its decimal equivalent
  - invalid trinary entires return to decimal 0
 - Trinary numbers can only contain three symbols: 0, 1, and 2
=end

class Trinary
  attr_reader :trinaries
  BASE = 3

  def initialize(trinaries)
    raise ArgumentError, "input needs to be string" unless trinaries.is_a?(String)
    @trinaries = trinaries
  end

  def to_decimal
    return 0 unless valid_trinaries_input?
    result = 0
    numbers = string_to_integers
    numbers.reverse.each_with_index do |num, idx|
      result += num * (BASE ** idx)
    end
    result
  end
  private

  def valid_trinaries_input?
    trinaries.match?(/\A[0-2]+\z/)
  end
  
  def string_to_integers
    trinaries.chars.map(&:to_i)
  end
end


tri = Trinary.new("222")
p tri.to_decimal
