=begin
requirement: convert an integer to roman numbers (string)
  - 1 => I, 2 => II, 3 => III
  - 4 => IV
  - 5 => V
  - 9 => IX
  - 10 => X , 2O => XX
  - 40 => XL
  - 50 => L , 60 => LX, 70 => LXX
  - 90 => XC
  - 100 => C, 200 => CC
  - 400 => CD
  - 500 => D, 600=> DC
  - 900 => CM
  - 1000 => M
data: a way to represent the rules- hash
algorithm:
=end

class Fixnum
  ROMAN_NUMERAL_RULES = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1,
  }
  def to_roman
    roman_numeral = ""
    modern_number = self
    ROMAN_NUMERAL_RULES.each do |key, value|
      roman_number = key
      amount_of_roman_letter = modern_number / value # 2894 / 1000 => 2 ; 894 / 500 => 1; 394 / 100 => 3 4 / 4 => 1
      roman_numeral += roman_number * amount_of_roman_letter# MM D CCC IV
      modern_number = modern_number - (amount_of_roman_letter * value)
    end
    roman_numeral
  end
end


