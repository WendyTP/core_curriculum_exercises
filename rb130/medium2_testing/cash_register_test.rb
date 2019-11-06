require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(200)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    p @register
    previous_reg = @register.total_money
    @register.accept_money(@transaction)
    current_reg = @register.total_money

    assert_equal((previous_reg + 50), current_reg)
  end

  def test_change
    @transaction.amount_paid = 300
    change = @transaction.amount_paid - @transaction.item_cost
    assert_equal(change, @register.change(@transaction))
  end

  def test_give_receipt
    @transaction.amount_paid = 200
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end



