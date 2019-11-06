
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*foods, food|
  puts foods.join(", ")
  puts food
end

gather(items) do |food1, *foods , food2|
  puts food1
  puts foods.join(", ")
  puts food2
end

gather(items) do |food, *foods|
  puts food
  puts foods.join(", ")
end

gather(items) do |food1, food2, food3, food4|
  puts "#{food1}, #{food2}, #{food3}, and #{food4} "
end