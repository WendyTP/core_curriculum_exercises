=begin
input: a single integer
output: returns the next featured number greater than given argument ; issue error message if no next featured number
featured_number:
  an odd number  + multiple of 7 + whose digits occur exactly once each
algorithm:
   - a method to check featured number
  - check if given number is featured number
    - if yes, add seven, check again featured number ; repeate until it is featured num
    - if not, increment by 1 and check featured number ; repeate until it is featured num
  - return error ?
=end


# first attempt

def digit_occur_once?(num)
  counter = 0
  num_arr = num.digits
  num_arr.each do |n|
    counter+= 1 if num_arr.count(n) > 1
    break if counter == 1
  end
  counter.zero?
end

def featured_number?(num)
  num.odd? && num % 7 == 0 && digit_occur_once?(num)
end

def featured(num)
  next_featured = num
  if num >= 9_876_543_210
    return "There is no possible number that fulfills those requirement"
  elsif featured_number?(num)
    loop do 
      next_featured = next_featured + 7
      break if featured_number?(next_featured)
    end
  else
    loop do
      next_featured = next_featured + 1
      break if featured_number?(next_featured)
    end
  end
  next_featured
end


# another solution
=begin
def featured(num)
  num += 1
  num += 1 unless num.odd? && num % 7 == 0

  loop do
    num_chars = num.to_s.chars
    return num if num_chars.uniq == num_chars
    num += 14
    break if num >= 9_876_543_210
  end

  "There's no possible number that fulfills those requirement"
end
=end



puts featured(12)
puts featured(20)
puts featured(21)
puts featured(997)
puts featured(1029)
puts featured(999_999)
puts featured(9_999_999_999)
      