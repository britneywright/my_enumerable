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

  def map
    ary = []
    self.each { |element|
      ary << yield(element) 
    }
    ary
  end

  def first
    self.each { |element|
      return element
    }
    return nil
  end

  def min
    smallest = self.first
    self.each { |element|
      if element <= smallest
        smallest = element
      end
    }
    smallest
  end

  def include?(target)
    self.each { |element|
      if element == target
        return true
      end
    }
    return false
  end
  
  def min_by(&block)
    smallest = yield(self.first)
    value = self.first
    self.each { |element|
      if yield(element) < smallest
        smallest = yield(element)
        value = element
      end
    }
    value
  end
end