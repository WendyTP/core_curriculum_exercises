=begin
requirement:
  Read the text file in the #process method
  pass the text to the block provided in each call
  work on is either part of the #process method or part of the blocks
   no other additions or changes.
  The text you use does not have to produce the same numbers as the sample output 
  but should have the indicated format.
# process: 
  pass in the link to the text via block
  create a collaborate obj of File class in the method
  call #read on the passed in link

=end

class TextAnalyzer
  attr_reader :text_link, :text
  def process
    @text_link = yield
    @text_in_strings = File.open(@text_link).read.chomp  # return a massive string
    @text_in_paragraphs_array = @text_in_strings.split("\n\n")
    
    puts "#{count_paragraphs} paragraphs"
    puts "#{count_lines} lines"
    puts "#{count_words} words"
  
  end

  def count_paragraphs
    @text_in_paragraphs_array.size
  end

  def count_words
    counter = 0
    @text_in_paragraphs_array.each do |string|
      counter += string.split(" ").size
    end
    counter
  end

  def count_lines
    counter = 0
    @text_in_paragraphs_array.each do |string|
      counter += string.split("\n").size
    end
    counter
  end
end

analyzer = TextAnalyzer.new
analyzer.process {"sample_text.txt"}


# 16 + 34 + 11 + 18 + 16  = 95
