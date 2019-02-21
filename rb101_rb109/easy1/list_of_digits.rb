# Concise approach
def digit_array(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_array(88)
puts digit_array(111) == [1,1,1]
p digit_array (1023)

# Improvement
def digit(num)
  num.to_s.split("").map {|ele| ele.to_i}
end

puts digit(7)
puts digit(1234)== [1,2,3,4]
p digit(333)

# first attempt
def digit_list(number)
  list_of_string = number.to_s.split("")
  digit_array = []
  list_of_string.each do |element|
    digit_array << element.to_i
  end
  digit_array
end

puts digit_list(3)
puts digit_list(2345)==[2,3,4,5]
puts digit_list(555)


# brute force approach, using .divmod
def brute_force(number)
  array = []
  chop_array = []
  loop do
  chop_array= number.divmod(10)
  array.unshift(chop_array.pop)
  number = chop_array[0]
  break if number == 0
  end
  array
end

p brute_force(1000)
p brute_force(4)

  
