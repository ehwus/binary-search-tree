class Node
  attr_reader :value
  
  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end