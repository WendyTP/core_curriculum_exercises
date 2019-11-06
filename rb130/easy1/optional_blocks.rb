=begin
request: a method that takes an optional block
def method
  if block_given?
    execut block 
    return block return value
  else
    "Does not compute"
=end

def compute
  if block_given?
    yield
  else
    "Does not compute"
  end
end

puts compute {5 + 3}
puts compute { 'a' + 'b' } == 'ab'
puts compute