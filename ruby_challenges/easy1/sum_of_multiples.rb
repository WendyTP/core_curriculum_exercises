=begin
requirement: 
  - given a natural number (positive int), can find the sum of all the multiples of particular numbers up to but not including that number
  - if no set of numbers given, default to 3 and 5
class SumOfMultiples
  def initialize
  def to(int.)
end

example: 
1..10
3+6+9+5 = 33

method imple:
  - validate input is positive integer
  - check if a set number is given, if not default set to 3 and 5
  - validate input is positve integer for to(int)
  - create a range(1...num)
  - iterate through set of array
    - select multiples of each element within given range
  - remove duplicates and nested array
  - add all numbers in the array
=end

class SumOfMultiples

  def initialize(*numbers)
    raise "input is not valid positive integers" unless numbers == [] || numbers.all?{|n| valid_positive_integer?(n)}
    @set_numbers = (numbers == []) ? [3,5] : numbers 
  end

  def self.to(max_num, set_numbers = [3,5])
    raise "input is not valid positive integers" unless SumOfMultiples.new.valid_positive_integer?(max_num)
    
    covered_range = (1...max_num)
    result = set_numbers.each_with_object([]) do |num, arr|
      arr << covered_range.select {|n| n % num == 0}
    end
  
    result.flatten.uniq.reduce(0){|sum, n| sum + n}
  end


  def to(max_num)
    self.class.to(max_num, @set_numbers)
  end

  def valid_positive_integer?(num)
    num.is_a?(Integer) && num > 0
  end
end

p SumOfMultiples.new(4,6).to(15)


