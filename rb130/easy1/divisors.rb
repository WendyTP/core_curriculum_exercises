=begin
input: a positive integer
output: an array of all the divisors of given integer
algorithm:
  - between (1..given num)
  - select the number that is number % given_num == 0

=end

=begin

def divisors(num)
  (1..num).select {|n| num % n == 0}
end
=end


# further_explore
def divisors(num)
  res = (1..num).each_with_object([]) do | divisor, result|
    quotient, remainder = num.divmod(divisor)
    break result if divisor > quotient
      result.push(quotient, divisor) if remainder == 0
  end.uniq.sort
end



    p divisors(1)
p divisors(7)
p divisors(12)
p divisors(98)
#p divisors(999962000357)