module Enumerable
  def my_each
    for x in self do
      yield(x)
    end
    self
  end

  def my_each_with_index
    0.upto(self.length - 1) { |i| yield(self[i], i) }
    self
  end

  def my_select
    result = []
    self.my_each { |x| result << x if yield(x) }
    result
  end

  def my_all?
    result = true
    self.my_each { |x| result = false if !yield(x) }
    result
  end

  def my_any?
    result = false
    self.my_each { |x| result = true if yield(x) }
    result
  end

  def my_none?
    self.my_any? ? false : true
  end

  def my_count
    return self.length unless block_given?
    count = 0
    self.my_each { |x| count += 1 if yield(x) }
    count
  end

  def my_map(proc=nil)
    result = self.clone
    self.my_each_with_index do |x, i|
      result[i] = proc.class == Proc ?
        proc.call(x) : yield(x)
    end
    result
  end

  def my_inject(acc=self[0])
    return self unless self.length > 1
    self.my_each_with_index do |x, i|
      next if i == 0
      acc = yield(acc, x)
    end
    acc
  end
end

def multiply_els(arr)
  arr.my_inject { |acc, curr| acc *= curr }
end

puts multiply_els([2,4,5]).to_s
puts [2,3,4].count {|x| x > 2}
puts [2,3,4].my_select {|x| x > 2}.to_s
puts [2,3,4].my_all? {|x| x > 2}
puts [2,3,4].my_all? {|x| x >= 2}
puts [2,3,4].my_any? {|x| x > 4}
puts [2,3,4].my_any? {|x| x >= 4}
puts [2,3,4].none? {|x| x >= 4}
puts [2,3,4].none? {|x| x > 4}
puts [2,3,4].my_map {|x| x * 4}.to_s
map_it = Proc.new {|x| x * 2}
puts [2,3,4].my_map(map_it) {|x| x * 4}.to_s
puts [2,3,4].my_map(15) {|x| x * 4}.to_s
