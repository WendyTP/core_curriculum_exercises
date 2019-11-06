require 'minitest/autorun'
require_relative 'cat'

class CatTest < MiniTest::Test

  def setup
    @kitty = Cat.new("Kitty")
  end

  def test_miaow
    skip
    assert_match(/ is miaowing\./, @kitty.miaow)
  end

  def test_raises_error
    assert_raises(ArgumentError) do 
      Cat.new
    end
  end

  def test_name
    assert(@kitty.name == 'Milo')
  end
end  