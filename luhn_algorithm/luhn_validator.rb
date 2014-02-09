class LuhnValidator
  attr_reader :weight
  def initialize(weight=[1,2,1,2,1,2,1,2,1,2,1])
    @weight = weight
  end

  def validate(input)
    check_sum = luhnify(input) % 10
    check_sum == 0 ? true : false
  end

  def check_digit_for(input)
    check_sum = luhnify(input)
    amount_to_zero(check_sum/weight[-1]).to_s
  end

  def luhnify(input)
    nums = to_nums(input)
    weighted = combine_weight(nums)
    combine_digits(weighted).reduce(:+)
  end

  def combine_digits(input)
    input.map { |num| num.to_s[-2].to_i + num.to_s[-1].to_i }
  end

  def combine_weight(input)
    input.each_with_index.map { |num, i| num * weight[i] }
  end

  def to_nums(input)
    input.chars.map(&:to_i)
  end

  def amount_to_zero(num)
    10 - num.to_s[-1].to_i
  end
end
