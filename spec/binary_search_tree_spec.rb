require 'binary_search_tree'

describe Node do
    it "creates itself and stores data" do
        test = Node.new("Test")
        expect(test).to be_a_kind_of(Node)
        expect(test.value).to eq("Test")
    end
end