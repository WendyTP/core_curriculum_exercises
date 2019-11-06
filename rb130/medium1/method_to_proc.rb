=begin
requirment:
  - convert an array of integers to base 8 (octal numbers)

=end

def convert_to_base_8(n)
  n.to_s(8).to_i
end


# The correct type of argument must be used below

base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object 
# (&a_proc) should become a block. a_proc should be the method convert_to_base_8

p [8, 10, 12, 14, 16, 33].map(&base8_proc)

