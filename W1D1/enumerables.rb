class Array

  def my_each
    for element in self do
      yield(element)
    end
    self
  end

  def my_select
    arr = []
    self.my_each { |el| arr << el if yield(el) }
    arr
  end

  def my_reject
    arr = []
    self.my_each { |el| arr << el if !yield(el) }
    arr
  end

  def my_any?
    self.my_each { |el| return true if yield(el) }
    false
  end

  def my_all?
    self.my_each { |el| return false if !yield(el) }
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      if !el.is_a? Array
        flattened << el
      else
        flattened.concat el.my_flatten
      end
    end
    flattened
  end

  def my_zip(*args)
    final_arr = []
    self.each.with_index do |el, idx|
      temp_arr = [self[idx]]
      args.my_each { |arr| temp_arr << arr[idx] }
      final_arr << temp_arr
    end
    final_arr
  end

  def my_rotate(num = 1)
    self.drop(num) + self.take(num)
  end

  def my_reverse
    arr = []
    self.my_each { |el| arr.unshift(el) }
    arr
  end

  def factors(num)
    factors = []
    self.each do |number|
      factors << number if (number % num).zero?
    end
    factors
  end

  def bubble_sort!(&prc)
    self.each_index do |idx1|
      self.each_index do |idx2|
        next if idx1 == idx2
          self[idx1], self[idx2] = self[idx2], self[idx1] if prc.call(self[idx1], self[idx2])
      end
    end
    self
  end

  def bubble_sort(&prc)
    sorted_arr = self.dup
    sorted_arr.bubble_sort!(&prc)
  end

end


def substrings(string)
  substrings = []
  string.chars.each_with_index do |ch1, idx1|
    string.chars.each_with_index do |ch2, idx2|
      substrings << string[idx1..idx2] unless string[idx1..idx2] == ''
    end
  end
  substrings.uniq
end

def subwords(word, dictionary)
  substrings(word).select { |w| dictionary.include?(w) }
end
