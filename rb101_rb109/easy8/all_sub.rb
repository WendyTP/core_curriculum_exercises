=begin
input: a string
output: an array of substrings, ordered by where in the string the substring begins
rules: use method from sutbstrings_at_start
=end

def substrings_at_start(sub_str)
  substrings =[]
  1.upto(sub_str.size) do |count|
    substrings << sub_str.slice(0,count)
  end
  substrings
end

p substrings_at_start('abc')
p substrings_at_start('a')
p substrings_at_start('xyzzy')

def substrings(str)
  result_arr = []
  0.upto(str.size-1) do |count|
    result_arr << substrings_at_start(str.slice(count,str.size))
  end
  result_arr.flatten
end

p substrings("abcde")

  