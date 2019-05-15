=begin
input: a positive integer
output: return an array containing integers between 1 to given integer
=end



def sequence(num)
  (1..num).to_a
end  

# another solution using each
=begin
def sequence(num)
  result = []
  (1..num).each {|n| result << n}
  result
end  
=end

p sequence(5)
p sequence(3)
p sequence(1)

# further exploration - if given arg. is negative or 0

def altered_sequence(num)
  if num > 0
    (1..num).to_a
  else
    (num..1).to_a.sort { |a,b| b <=> a}
  end
end

p altered_sequence(0)
p altered_sequence(3)
p altered_sequence(-3)