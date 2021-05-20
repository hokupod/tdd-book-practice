require "minitest/autorun"
require_relative "../../src/lib/money/dollar"

class MoneyTest < Minitest::Test
  def setup
  end

  def test_multiplication
    five = Money::Dollar.new(5)
    five.times(2)
    assert_equal 10, five.amount
  end
end
