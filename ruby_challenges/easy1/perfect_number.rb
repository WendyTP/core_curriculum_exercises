=begin
requirement: given a number, tell if it's perfect, abundant, deficient
  natural numbbers: 0,1,2...  or 1,2,...
  Perfect: Sum of factors (exclude number itself) = number
  Abundant: Sum of factors > number
  Deficient: Sum of factors < number
  1 is the only number it's aliquot sum is 0 ==> deficient num
  ex. 6 --> 1,2,3,(6) => 1 + 2+3 == 6 (perfect num)
input: a positive integer (raise error if not positive integer)
output: a string "perfect", "abudant", "deficient"
data: a range of numbers from (1..num)
algorithm:
  - find divisors of given number
  - remove the number itself from the divisor set
  - add the divisors and compare with given number
  - return compared result (string)
=end

class PerfectNumber

  def self.classify(number)
    raise RuntimeError, "input needs to be a positive integer" unless self.valid_positive_integer?(number)
   
    divisors = self.find_divisors(number)
    aliquot_sum = self.compute_aliquot_sum(divisors)

    case
    when aliquot_sum == number then "perfect"
    when aliquot_sum > number then "abundant"
    else                           "deficient"
    end
  end

  def self.compute_aliquot_sum(divisors)
    divisors[0..-2].reduce(0) {|sum, n| sum + n}
  end

  def self.find_divisors(number)
    (1..Integer.sqrt(number)).each_with_object([]) do |n, arr|
      arr << [n, number/n] if number % n == 0
    end.flatten.uniq.sort
  end

  def self.valid_positive_integer?(number)
    number.class == Integer && number > 0
  end
end

