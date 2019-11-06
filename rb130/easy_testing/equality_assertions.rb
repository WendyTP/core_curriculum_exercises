require 'minitest/autorun'


class DowncaseTest < MiniTest::Test
  def test_downcase
    value = "XYZ"
    assert_equal("xyz", value.downcase)
  end
end


