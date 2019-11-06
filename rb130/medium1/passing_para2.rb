=begin
requirement: 
  def method(array)
    yield(contents of array)
  end
  {block: ignore first 2 elements, and group all other ele into a raptors arry}
input: an array


=end

# first approach
=begin
def bird_naming(birds_arr)
  yield(birds_arr)
end

birds = %w( raven finch hawk eagle)
raptors = nil
bird_naming(birds) do |group|
  raptors = group[2..-1]
end

p raptors
=end

# second approach
def bird_naming(birds_arr)
  yield(birds_arr)
end

birds = %w( raven finch hawk eagle)

bird_naming(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end

