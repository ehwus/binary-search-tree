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
    build_tree(starting_data)
  end

  def build_tree(array)
    if array.empty?
      @root = nil
      return
    end

    array.each { |value| insert(value) }
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    end
  end
end