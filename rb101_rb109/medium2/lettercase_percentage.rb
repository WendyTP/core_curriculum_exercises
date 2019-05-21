=begin
input: a string contains at least 1 char
output: a hash contains 3 entries :
  one represents the percentage of characters in the string that are lowercase letters, 
  one the percentage of characters that are uppercase letters, 
  and one the percentage of characters that are neither.
algorithm:
  - total number of chars
  - a way to calculate percentage ratio
  - to count chars based on different case
=end

def percentage_ratio(total_num, individual_num)
  ratio= 100 / total_num.to_f * individual_num
  ratio == ratio.to_i ? ratio.to_i : format("%.2f", ratio).to_f   # or simply ratio.round(2)
end


def letter_percentages(str)
  letter_count_hash = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  percentages = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

total_chars = str.size
letter_count_hash[:lowercase] = str.count("a-z")
letter_count_hash[:uppercase] = str.count("A-Z")
letter_count_hash[:neither] = str.count("^a-zA-Z")

letter_count_hash.each do |type, count|
  percentages[type] = percentage_ratio(total_chars, count)
end

percentages

end



p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')
p letter_percentages("abcdefGHI")