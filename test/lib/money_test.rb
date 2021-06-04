require "minitest/autorun"
require_relative "../../src/lib/money/dollar"

class MoneyTest < Minitest::Test
  def setup
  end

  def test_multiplication
    five = Money::Dollar.new(5)
    product = five.times(2)
    assert_equal 10, product.amount
    product = five.times(3)
    assert_equal 15, product.amount
  end

  def test_equality()
    assert(Money::Dollar.new(5).equals(Money::Dollar.new(5)))
    assert(!(Money::Dollar.new(5).equals(Money::Dollar.new(6))))
  end
end
