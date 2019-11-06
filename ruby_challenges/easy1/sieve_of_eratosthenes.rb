


=begin
requirement: a program that uses the Sieve of Eratosthenes to find 
  all the primes from 2 up to a given number.
input: a positive integer >= 2 (assume input is correct)
output: an array of primes
class Sieve
  def iniitiaze(num)
    @num_range = (2..num)
  def primes
end
[2,3,4,5] 
[2,3,4,5].clone

data: array
algorithm:
- create an array of num_range
- create a copy of the array
- multiplier = 2
- iterate through array
    while element * multiplier is included in array
      if clone includes element * multiplier
      delete element * multiplier in clone
      multiplier += 1
- return modified clone
=end


class Sieve
  attr_reader :numbers
  def initialize(number)
    @numbers = (2..number).to_a
  end

  def primes
    cloned_numbers = numbers.clone
    numbers.each do |num|
      multiplier = 2
      while numbers.include?(num * multiplier)
        if cloned_numbers.include?(num * multiplier)
          cloned_numbers.delete(num * multiplier)
        end
        multiplier += 1
      end
    end
    cloned_numbers
  end
end

sieve = Sieve.new(1000)
p sieve.primes

