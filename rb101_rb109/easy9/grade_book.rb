=begin
input: 3 integers between 0 an 100
output: a string from the grading hash

=end

GRADING = {
  "A" => (90..100),
  "B" => (80...90),
  "C" => (70...80),
  "D" => (60...70),
  "F" => (0...60)
}


def get_grade(gr1,gr2,gr3)
  average_score = (gr1 + gr2 + gr3) / 3
  GRADING.values.each do |score_range|
    if score_range.include?(average_score)
      return GRADING.key(score_range)
    end
  end
end



puts get_grade(95,90,93)
puts get_grade(50,50,95)