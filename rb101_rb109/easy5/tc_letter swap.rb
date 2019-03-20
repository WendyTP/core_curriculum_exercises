require "test/unit"

require_relative "letter_swap"


class TestSimpleString < Test::Unit::TestCase

  def test_swap
    $sentence_list.each do |input, expected_output| 
      assert_equal("#{expected_output}", swap("#{input}"))
    end
  end

  def test_word_transformer
    assert_raise( NoMethodError ) { word_transformer(123432)}
  end
 
end



$sentence_list = {
  "star is good" => "rtas si doog",
  "I love my lady" => "II eovl ym yadl",
  "It's my life from bon jovi" => "st'I ym eifl mrof nob iovj"
}