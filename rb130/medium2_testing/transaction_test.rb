require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(200)
    input = StringIO.new("300\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    
    assert_equal(300, transaction.amount_paid)
  end



end