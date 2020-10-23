class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add_left(value)
    @left = Node.new(value)
  end

  def add_right(value)
    @right = Node.new(value)
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
    if @root.nil?
      @root = Node.new(value)
    end

    pointer = @root
    loop do
      if pointer.value == value
        # avoid adding duplicates
        break
      elsif value > pointer.value
        # check if right node exists
        if pointer.right.nil?
          pointer.add_right(value)
          break
        else
          pointer = pointer.right
          next
        end
      else
        # check if left node exists
        if pointer.left.nil?
          pointer.add_left(value)
          break
        else
          pointer = pointer.left
          next
        end
      end
    end
  end

  def delete(value)
    if @root.left.nil? && @root.right.nil?
      @root = nil if @root.value == value
      return
    end

    pointer = @root
    loop do
      return if pointer.nil?

      if pointer.right.value == value
        pointer.right = nil
        break
      elsif pointer.left.value == value
        pointer.left = nil
        break
      end

      pointer = pointer.value > value ? pointer.left : pointer.right
    end
  end
end
