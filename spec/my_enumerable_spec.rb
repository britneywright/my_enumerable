describe "MyEnumerable" do
  class MyCollection
    def initialize(ary)
      @ary = ary
    end

    def each
      @ary.each {|element| yield element}
    end
  end
  specify "#count returns the number of elements" do
    expect(MyCollection.new([]).count).to eq 0
    expect(MyCollection.new([2]).count).to eq 1
    expect(MyCollection.new([1, 4, 5, 6]).count).to eq 4
  end
end
