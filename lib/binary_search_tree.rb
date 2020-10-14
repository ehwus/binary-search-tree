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
  def initialize(array)
    
  end
end