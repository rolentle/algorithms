class Node
  attr_accessor :data, :lesser_child, :greater_child, :parent, :root

  def initialize(data, root = false)
    @data = data
    @root = root
  end

  def branch(input)
    input = to_node(input)

    if input.data > data
      if greater_child?
	@greater_child.branch input
      else
        @greater_child = input
        @greater_child.parent = self
      end
    else
      if lesser_child?
	@lesser_child.branch input
      else
        @lesser_child = input
	@lesser_child.parent = self
      end
    end
  end

  def find(query)
    query = to_node(query)
    if query.data == data
      return self
    elsif query.data > data
      if greater_child?
	@greater_child.find(query)
      else
	nil
      end
    else
      if lesser_child?
	@lesser_child.find(query)
      else
	nil
      end
    end
  end

  def sort
    sorted_list = []
    if lesser_child?
      sorted_list << lesser_child.sort
    end

    sorted_list << self.data

    if greater_child?
      sorted_list << greater_child.sort
    end

    sorted_list.flatten
  end


  def root?
    root
  end

  def children_full?
    greater_child? && lesser_child?
  end

  def any_children?
    greater_child? || lesser_child?
  end

  def no_children?
    !greater_child? && !lesser_child?
  end

  def greater_child?
    !@greater_child.nil?
  end

  def lesser_child?
    !@lesser_child.nil?
  end

  def is_lesser_child?
    self.parent.lesser_child == self
  end

  def is_greater_child?
    self.parent.greater_child == self
  end

  def runaway
      if self.parent.lesser_child? && is_lesser_child?
	self.parent.lesser_child = nil
      elsif self.parent.greater_child? && is_greater_child?
	self.parent.greater_child = nil
      end
      self.parent = nil
  end


  def to_node(input)
    input = Node.new(input) unless input.class == Node
    return input
  end

end
