gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'luhn_validator'

class LuhnTest < Minitest::Test
  # This test suite is not meant to be exhaustive,
  # just a start. Write your own tests!

  attr_reader :validator

  def setup
    @validator = LuhnValidator.new
  end

  def test_to_numbers_from_input
    assert_equal [1,2,3,4], validator.to_nums("1234")
  end

  def test_amount_to_zero
    assert_equal 2,validator.amount_to_zero(8)
    assert_equal 5,validator.amount_to_zero(15)
  end

  def test_combine_weight_to_input
    assert_equal [1, 4, 3, 8], validator.combine_weight([1,2,3,4])
    input = [7,9,9,2,7,3,9,8,7,1,3]
    output = [7,18,9,4,7,6,9,16,7,2,3]
    assert_equal output, validator.combine_weight(input)
  end

  def test_combine_multiple_digit_numbers
    assert_equal [2,4,6,8], validator.combine_digits([11,4,6,8])
  end

  def test_it_validates_the_example_account_number
    assert_equal true, validator.validate('79927398713')
  end

  def test_it_finds_the_check_digit_for_an_identifier
    assert_equal '3', validator.check_digit_for('7992739871')
  end
end
