require 'minitest/autorun'

class NilTest < MiniTest::Test
  def test_nil2
    value = nil
    assert_nil(value)
  end

  def test_nil
    value = "su"
    assert_nil(value)
  end
end