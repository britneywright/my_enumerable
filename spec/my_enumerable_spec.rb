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

  # -- implement me --
  # group_by
  # first
  # all?
  # min
  # min_by
  # include?
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
