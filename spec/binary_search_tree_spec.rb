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
end