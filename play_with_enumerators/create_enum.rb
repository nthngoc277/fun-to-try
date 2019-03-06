module MyEnumerable
  def simple_reduce(acc)
    p self.class
    self.each do |value|
      acc = yield(acc, value)
    end
    acc
  end
end

class Array
  include MyEnumerable
end

p [1,2,3,4].simple_reduce(0) { |total, num| total + num }
