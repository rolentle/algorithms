class HashSort
  attr_reader :input_data
  def initialize(input_data)
    @input_data = input_data
  end

  def sort
    group_by(:time).map do |array_hash|
      combine_hashes(array_hash)
    end.flatten
  end

  def group_by(key)
    input_data.group_by { |data| data[key] }
  end

  def combine_hash(input_hash)
    input_hash[1].each_with_object({}) do |value_hash, hash|
      hash.merge!(value_hash)
    end
  end

  def combine_hashes(hashes)
      hashes.map { |k,v| combine_hash(hashes) }.uniq
  end
end
