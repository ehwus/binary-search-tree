class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(other)
    value <=> other.value
  end
end

class Tree
  attr_accessor :root
  def initialize(starting_data = [])
    processed_list = starting_data.sort.uniq
    @root = build_tree(processed_list, 0, processed_list.length - 1)
  end

  def build_tree(array, start, finish)
    return nil if start > finish

    mid = (start + finish) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, finish)
    root
  end

  def insert(value)
    @root = Node.new(value) if @root.nil?
  end
end