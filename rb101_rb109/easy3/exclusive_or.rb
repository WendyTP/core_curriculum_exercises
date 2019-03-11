=begin
rule: 
  - wirte a method that performs exclusive or:
  - take 2 arguments, and return true if exactly one of its argument is truthy; false otherwise  
=end


# idomatic ruby
def xor?(value1,value2)
  (value1 && !value2) || (value2 && !value1)
end

# simpler version
=begin
def xor?(value1,value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end  
=end

# first attempt
=begin
def xor?(arg1, arg2)
  if (arg1 == true || arg2 == true ) && !(arg1 == true && arg2 == true)
    return true
  else
    false
  end
end
=end
p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.odd?) 
p xor?(5.odd?, 4.even?) 
p xor?(5.even?, 4.odd?) 


# second attempt
=begin 
def xo?(n1,n2)
  if n1 == true && n2 == true
    return false
  elsif n1 != true && n2 != true
    return false
  else
    return true
  end
end

p xo?(5.even?, 4.even?)
p xo?(5.odd?, 4.odd?) 
p xo?(5.odd?, 4.even?) 
p xo?(5.even?, 4.odd?) 
=end
