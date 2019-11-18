=begin
* The Luhn formula is a checksum formula to validate a variety of identification numbers
requirement:
  - check number if valid per luhn
  - create a valid number from invalid one
algorithm:
738 -> 768 -> 21- > invalid
123 -> 143 -> 8 -> invalid -> 123x 
  226x -> 10 + x --> x == 0
2323 2005 7766 355 -> 2626 2001 7563 315 -> 49 -> invalid
  ->  2323 2005 7766 355x -> 4343 4005 5736 651x -> 56 + x  == 60
  x == 4
data: array
process:
  - def addends
    # objective: add the number as per luhn formula, return array
    # 12_121 --> [1,4,1,4,1]
  - def checksum
     # objetive: return the checksum of given num
    # call addends first 
    # add up the sum of the array , return integer(sum)
  - def valid?
     # objective: check if the given num is valid luhn
    # call checksum first
    # if the sum % 10 != 0, then it's invalid (false)
  - def self.create
    # objective : create a valid luhn if the given num is not valid
    # if not, add an extra num to given num ([1,2,1,2] -> [1,2,1,2,x])
      # compute the checksum (without x)
      # checksum % 10 == remainder ; 10 - remainder == x
    # return the new number
=end

class Luhn
  attr_reader :number
  attr_accessor :digits

  def initialize(number)
    @digits = number_to_digits(number)
  end

  def number_to_digits(number)
    number.to_s.each_char.map(&:to_i)
  end

  def digits_to_number(digits)
    digits.join.to_i
  end

  def addends
    added_numbers = []
    digits.reverse.each_with_index do |digit, idx|
      if idx.odd?
        added_numbers << (digit * 2)
      else
        added_numbers << digit
      end
    end

    added_numbers.reverse.map do |digit|
      digit >= 10 ? digit - 9 : digit
    end
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    luhn_sum = checksum
    luhn_sum % 10 == 0
  end

  def self.create(number)
    luhn = Luhn.new(number)

    return number if luhn.valid?

    luhn.digits  = luhn.digits << 0
    luhn_sum = luhn.checksum

    unless luhn.valid?
      extra_num = 10 - (luhn_sum % 10)
      luhn.digits[-1] = extra_num
    end

    luhn.digits_to_number(luhn.digits)
  end
  

end

