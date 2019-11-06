=begin
Range#step
# step(n=1) {block} => calling range
# step(n=1) {no block} => an enumerator
# (2..5).step(1) {|v| p v}
   # 2, 3, 4, 5 #=> (2..5)
# (2..5).step(3) {|v| p v}
   # 2, 5   #=> (2..5)
# ("a".."e").step(2) {|v| p v}
  # "a", "c", 'e  #=> ("a".."e")

custom#step
input: starting v; ending v; step v; block
output: return nil
data: array
algorithm:
  - set array = (start v..end v)
  - step = 3rd arg.
  - index = 0
  - while index <= array.size - 1
      - yield(array[index])
      - index += step
  - return nil
=end

def step(start_value, end_value, step_value)
  arr = (start_value..end_value).to_a
  index = 0
  while index <= ((arr.size) - 1)
    yield(arr[index])
    index += step_value
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }
p step("a", "e", 2) { |value| puts "value = #{value}" }