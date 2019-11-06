def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute"
  end
end

puts compute(1) {|n| n + 2}
puts compute([1,2]) {|n| n + [3,4]}
puts compute("a")