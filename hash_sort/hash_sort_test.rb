gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './hash_sort'

class HashSortTest < Minitest::Test

  def test_hash_sort_exists
    assert HashSort
  end

  def test_hash_sort_takes_in_data
    @hash_sort = HashSort.new([{time: 201201, x: 2 }])
    assert_equal [{time: 201201, x: 2 }], @hash_sort.input_data
  end

  def test_hash_sort_can_sort_one_time
    @hash_sort = HashSort.new([{time: 201201, x: 2}, {time: 201201, y: 7}])
    sorted_hash = [ {time: 201201, x:2, y:7}]
    assert_equal sorted_hash, @hash_sort.sort
  end

  def test_hash_can_sort_two_times
    hash_array = [{ time: 201201, x:2 }, {time: 201202, a: 1},
		   {time: 201201, y:7}]
    @hash_sort = HashSort.new(hash_array)
    sorted_hash = [{time: 201201, x:2, y:7}, {time: 201202, a:1 }]
    assert_equal sorted_hash, @hash_sort.sort
  end
end
