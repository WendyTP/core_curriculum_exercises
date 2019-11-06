require 'minitest/autorun'

class EmptyObjectTest < MiniTest::Test
  def test_empty
    list = []
    assert_empty(list)
  end

  def test_empty1
    list = [1]
    assert_empty(list)
  end
end