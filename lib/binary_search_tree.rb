class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def <=>(node)
    value <=> node.value
  end
end

class Tree
  attr_accessor :root, :value
  def initialize(starting_data)
    @root = build_tree(starting_data, 0, starting_data.length - 1)
  end

  def build_tree(array, start, finish)
    return nil if start > finish

    mid = (start + finish) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid - 1)
    root.right = build_tree(array, mid + 1, finish)
    root
  end
end