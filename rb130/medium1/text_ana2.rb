class TextAnalyzer
  def process
    file = File.open("sample_text.txt", 'r')
    yield(file.read)  # yield a massive string
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process {|text| puts "#{text.split("\n\n").count} paragraph" }
analyzer.process {|text| puts "#{text.split("\n").count} lines"} # counted empty lines between paragraph
analyzer.process {|text| puts "#{text.split(" ").count} words"}