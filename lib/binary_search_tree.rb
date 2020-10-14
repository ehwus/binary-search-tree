class Node
  include Comparable
  attr_reader :value, :left, :right

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
  attr_reader :root
  def initialize(starting_data)
    @root = build_tree(starting_data)
  end

  def build_tree(array)
    @root = nil if array.empty?
  end
end