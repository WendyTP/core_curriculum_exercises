factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = (number.zero?) ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end


# print the first 7 factorials by using an "External Iterator"
7.times {puts factorial.next} 

# reset your Enumerator
factorial.rewind

 # reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".
 factorial.each_with_index do |number, index|
  puts number
  break if index == 6
 end


