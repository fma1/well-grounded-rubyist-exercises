class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end

class Integer
  def my_times
    (0..self).to_a.my_each { |n| yield n }
    self
  end
end

5.my_times { |i| puts "I'm on iteration #{i}!" }