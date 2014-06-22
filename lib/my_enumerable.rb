module MyEnumerable
  def count
    count = 0
    self.each { count += 1 }
    count
  end

  def find
    self.each { |element|
      if yield(element)
        return element
      end
    }
    return nil
  end

  def select
    ary = []
    self.each { |element|
      if yield(element)
        ary << element
      end
    }
    ary
  end
end