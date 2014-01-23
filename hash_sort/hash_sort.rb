class HashSort
  attr_reader :input_data
  def initialize(input_data)
    @input_data = input_data
  end

  def sort
    group_by_times.map do |array_hash|
      array_hash.map do |k,v|
	array_hash[1].each_with_object({}) do |value_hash, hash|
	  hash.merge!(value_hash)
	end
      end.uniq
    end.flatten
  end

  def group_by_times
    input_data.group_by { |data| data[:time] }
  end
end
