require "test/unit"

require_relative "cute_angles"


class TestSimpleString < Test::Unit::TestCase

  def test_angles
    $sentence_list.each do |input, expected_output| 
      assert_equal(expected_output, angles(input))
    end
  end

  def test_word_transformer
    assert_raise( NoMethodError ) { angles("string")}
  end
 
end



$sentence_list = {
  93.034773 => "93° 2' 5",
  30 => "30° 0' 0"
}