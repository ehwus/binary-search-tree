require 'binary_search_tree'

describe Node do
  it "creates itself and stores data" do
    test = Node.new("Test")
    expect(test).to be_a_kind_of(Node)
    expect(test.value).to eq("Test")
  end

  it "can be chained to another Node" do
    test0 = Node.new(0)
    test1 = Node.new(1, test0)
    expect(test1.left.value).to eq(0)
  end

  it "can be chained to two other Nodes" do
    test0 = Node.new(0)
    test1 = Node.new(1)
    test2 = Node.new(2, test1, test0)
    expect(test2.left.value).to eq(1)
    expect(test2.right.value).to eq(0)
  end

  it "can be compared" do
    test0 = Node.new(0)
    test1 = Node.new(1)
    expect(test0 > test1).to eq(false)
    expect(test1 > test0).to eq(true)
    expect(test1 == test0).to eq(false)
  end
end

describe Tree do
  it "accepts an array when initialized" do
    tree = Tree.new([1, 2, 3])
    expect(tree).to be_a_kind_of(Tree)
  end

  describe "#build_tree" do
    it "returns empty root if given empty array" do
      tree = Tree.new([])
      expect(tree.root).to eq(nil)
    end

    it "builds a binary tree from initial array of one" do
      tree = Tree.new([1])
      expect(tree.root.value).to eq(1)
    end

    it "makes a tree of 3" do
      tree = Tree.new([1, 2, 3])
      expect(tree.root.value).to eq(2)
      expect(tree.root.left.value).to eq(1)
      expect(tree.root.right.value).to eq(3)
    end

    it "makes a larger tree" do
      tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(tree.root.value).to eq(5)
      expect(tree.root.left.left.value).to eq(1)
      expect(tree.root.right.right.value).to eq(8)
      expect(tree.root.right.left.value).to eq(6)
    end

    it "accounts for unordered list" do
      tree = Tree.new([9, 8, 7, 6, 5, 4, 3, 2, 1])
      expect(tree.root.value).to eq(5)
      expect(tree.root.left.left.value).to eq(1)
      expect(tree.root.right.right.value).to eq(8)
      expect(tree.root.right.left.value).to eq(6)
    end

    it "accounts for unordered list and duplicates" do
      tree = Tree.new([69, 69, 420, 1, 2])
      expect(tree.root.value).to eq(2)
      expect(tree.root.left.value).to eq(1)
      expect(tree.root.right.value).to eq(69)
    end
  end

  describe "#insert" do
    it "inserts into an empty tree" do
      empty = Tree.new
      empty.insert(1)
      expect(empty.root.value).to eq(1)
    end

    it "does nothing if already inserted" do
      tree = Tree.new([1])
      tree.insert(1)
      expect(tree.root.right).to eq(nil)
      expect(tree.root.left).to eq(nil)
    end

    it "adds to tree of one" do
      tree = Tree.new([1])
      tree.insert(2)
      expect(tree.root.right.value).to eq(2)
    end

    it "adds left to tree of one" do
      tree = Tree.new([3])
      tree.insert(1)
      expect(tree.root.left.value).to eq(1)
    end

    it "adds to a more complex tree" do
      tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
      tree.insert(0)
      tree.insert(10)
      expect(tree.root.left.left.left.value).to eq(0)
      expect(tree.root.right.right.right.right.value).to eq(10)
    end
  end

  describe "#delete" do
    it "does nothing if value not found" do
      tree = Tree.new([1])
      tree.delete(2)
      expect(tree.root.value).to eq(1)
    end

    it "deletes value from tree of 1" do
      tree = Tree.new([1])
      tree.delete(1)
      expect(tree.root).to eq(nil)
    end
  end
end
