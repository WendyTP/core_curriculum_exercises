
# first attempt
def sequence(count_num,num)
  return [] if count_num == 0
  result = []
  1.upto(count_num) do |n|
    result << num * n
  end
  result
end


# another solution using map
=begin
def sequence(count, first)
  (1..count).map {|index| first * index}
end
=end

p sequence(5,1)
p sequence(4,-7)
p sequence(3,0)
p sequence(0,10000)