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