# first attempt
=begin
class FixedArray
  private

  attr_accessor :array
  
  public

  def initialize(num)
    @array = [nil] * num
  end

  def [](idx)
    array[idx]
  end

  def []=(idx,value)
    array[idx] = value
  end
  
  def to_a
    array
  end

  def to_s
    array.to_s
  end
end
=end

# another way
class FixedArray
  def initialize(max_size)
    @array = Array.new(max_size)
  end

  def [](idx)
    @array.fetch(idx)
  end

  def []=(idx, value)
    self.[](idx)
    @array[idx] = value
  end

  def to_a
    array.clone
  end

  def to_s
    array.to_a.to_s
  end

  private
  attr_reader :array
end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

a = fixed_array.to_a
p a
a.delete_at(0)
p a
p fixed_array.to_a