=begin
input: a string (or empty string)
output: the string within a box  
rules:
  - assume the given string will always git within terminal
  - string can be empty
data:
example: "super".center(7," ") => " super "
side frame * 2: "||".insert (1, " "* (string length+2)
middle frame: "||".insert(1, string + space)
top & bottom frame : "++".insert(1,"-"*(string length + 2))  
=end


# first attempt
=begin
def print_in_box(sentence)
  padded_sentence = sentence.center((sentence.length+2)," ")
  side_frame = "||".insert(1," "*(padded_sentence.length))
  middle_frame = "||".insert(1,padded_sentence)
  top_bottom_frame = "++".insert(1,"-"*(padded_sentence.length))

  puts " #{top_bottom_frame} \n #{side_frame} \n #{middle_frame} \n #{side_frame} \n #{top_bottom_frame}"
end
=end

# another way
=begin
def print_in_box(sentence)
  horizontal_rule = "+#{'-'*(sentence.length+2)}+"
  empty_line = "|#{' '*(sentence.length+2)}|"
  
  puts horizontal_rule
  puts empty_line
  puts "| #{sentence} |"
  puts empty_line
  puts horizontal_rule
end  
=end

# put word length restriction-- terminal window : 80 column

def print_in_box(sentence)
  sentence = sentence[0..75] if sentence.length > 76
  padded_sentence = sentence.center((sentence.length+2)," ")
  side_frame = "||".insert(1," "*(padded_sentence.length))
  middle_frame = "||".insert(1,padded_sentence)
  top_bottom_frame = "++".insert(1,"-"*(padded_sentence.length))

  puts " #{top_bottom_frame} \n #{side_frame} \n #{middle_frame} \n #{side_frame} \n #{top_bottom_frame}"
end


print_in_box("")
print_in_box("Too bodly go where no one has gone before")

# further exploration- wrapped sentence
SENTENCE_LENGTH_PER_LINE = 10

def splitting_sentence(sentence)
  splited_lines =[]
  sentence_array = sentence.split  #["this", "is", "good"]
  temp_string = ""
  sentence_array.each do |word|
    if (temp_string.length + word.length) < SENTENCE_LENGTH_PER_LINE
      temp_string << word + " "
    else 
      splited_lines << temp_string.chop.center((SENTENCE_LENGTH_PER_LINE+2)," ")
      temp_string = word+ " "
    end
  end
  splited_lines << temp_string.chop.center((SENTENCE_LENGTH_PER_LINE+2)," ")
  splited_lines
  end

  






=begin
def splitting_sentence(sentence)
  splited_lines = []
  index = 0
  while index < sentence.length
    splited_lines << sentence[index,10]
    index += 10
  end
  splited_lines.map! do |line|
    line.center((SENTENCE_LENGTH_PER_LINE+2)," ")
  end
end
=end


def print_in_wrapped_box(sentence)
  horizontal_rule = "+#{'-'* (SENTENCE_LENGTH_PER_LINE+2)}+"
  empty_rule = "|#{' '*(SENTENCE_LENGTH_PER_LINE+2)}|"
  puts horizontal_rule
  puts empty_rule
  splitting_sentence(sentence).each do |each_line|
    puts "|#{each_line}|"
  end
  puts empty_rule
  puts horizontal_rule
end

print_in_wrapped_box("this is a super super supppper long sentence and just very very long")
print_in_wrapped_box("")
