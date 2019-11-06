=begin
input:a string of digits ("01234"), an integer
output: a nested array
requirement:
  - a class Series
    - init
    - slices(integer)
      - raise ArgumentError if integer > string.size
"012" --> ["0", "1", "2"] --> [0, 1, 2]
[0,1,2].slice(0,2) --> [0,1]
=end

class Series
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def slice(num)
    raise ArgumentError, "over string size" if num > string.size
    digits = string.chars.map(&:to_i)
    result = []
    digits.each_with_index do |_, idx|
      break if digits.slice(idx,num).size < num
      result << digits.slice(idx, num)
    end
    result 
  end

end

series = Series.new("01234")
p series.slice(1)
p series.slice(2)
p series.slice(3)
p series.slice(4)
p series.slice(5)

series = Series.new("0103289044")
#series.slice(series.string.length + 1)