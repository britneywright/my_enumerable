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

  # -- implement me --
  # find
  # select
  # map
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
