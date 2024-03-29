require 'my_enumerable'

describe "MyEnumerable" do
  class MyCollection
    include MyEnumerable
    def initialize(collection)
      @collection = collection
    end

    def each
      @collection.each {|element| yield element}
    end
  end
  
  specify "#count returns the number of elements" do
    expect(MyCollection.new([]).count).to eq 0
    expect(MyCollection.new([2]).count).to eq 1
    expect(MyCollection.new([1, 4, 5, 6]).count).to eq 4
  end

  specify "#find returns first element for which the block is truthy" do
    expect(MyCollection.new(1..10).find {|element| element * 2 == 10}).to eq 5
    expect(MyCollection.new(1..10).find { false }).to eq nil
  end

  specify "#select returns an array of all elements for which the block is truthy" do
    expect(MyCollection.new(1..10).select {|element| element.even?}).to eq [2, 4, 6, 8, 10]
    expect(MyCollection.new(1..10).select {|element| element > 7 }).to eq [8, 9, 10]
    expect(MyCollection.new(1..10).select {|element| element < 1 }).to eq []
  end
  
  specify "#map returns an array of the block result for each element" do
    expect(MyCollection.new(1..5).map {|element| element + 1 }).to eq [2, 3, 4, 5, 6]
    expect(MyCollection.new(1..5).map {|element| element * 2 }).to eq [2, 4, 6, 8, 10]
    expect(MyCollection.new([]).map {|element| element + 1 }).to eq []    
  end

  specify "#first returns the first element of the collection" do
    expect(MyCollection.new(1..5).first).to eq 1
    expect(MyCollection.new([20, 1, 5, 9]).first).to eq 20
    expect(MyCollection.new([]).first).to eq nil
  end

  specify "#min returns smallest element of the collection" do
    expect(MyCollection.new(1..5).min).to eq 1
    expect(MyCollection.new([20, 1, 5, 9]).min).to eq 1
    expect(MyCollection.new([]).min).to eq nil
  end

  specify "#include? returns true if specified element exists in the collection" do
    expect(MyCollection.new(1..5).include?(1)).to eq true
    expect(MyCollection.new(1..5).include?(10)).to eq false
  end

  specify "#min_by returns smallest value of the block" do
    expect(MyCollection.new([[2, 5], [1, 3], [20, 5]]).min_by {|element| element[0]}).to eq [1, 3]
    expect(MyCollection.new([[2, 5], [1, 30], [20, 5]]).min_by {|element| element[1]}).to eq [2, 5]
    expect(MyCollection.new(["dog", "cat", "horse"]).min_by {|x| x.length }).to eq "dog"
    expect(MyCollection.new([]).min_by {|x| x }).to eq nil
  end
  
  # -- implement me --
  # group_by
  # all?
  # take

  # -- extra credit --
  # to_a
  # reject
  # partition
  # any?
  # one?
  # none?
  # max
  # max_by
  # inject
  # each_with_index
  # each_with_object
  # zip
  # take_while
  # drop
  # drop_while
  # cycle
end
