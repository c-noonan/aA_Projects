def range(start, stop)
  return [start] if stop == start
  range(start, stop-1) + [stop]
end

def exp1(num, power)
  return 1 if power == 0
  num * exp1(num, power - 1)
end

def exp2(num, power)
  return 1 if power == 0
  return num if power == 1
  if power.even?
    exp2(num, power/2)**2
  else
    num * exp2(num, (power - 1) / 2)**2
  end
end

def deep_dup(arr)
  return [] if arr.empty?
  if arr[0].is_a?(Array)
    [deep_dup(arr[0])] + deep_dup(arr[1..-1])
  else
    return [arr[0]] if arr.length == 1
    # return arr[0] if arr.length == 1
    [arr[0]] + deep_dup(arr[1..-1])
  end
end

def fib_iterative(n)
  return [] if n == 0
  return [0] if n == 1
  fib_seq = [0, 1]
  (n - 2).times do
    fib_seq << fib_seq[-2] + fib_seq[-1]
  end
  fib_seq
end

def fib_recursive(n)
  return [] if n == 0
  return [0] if n == 1
  return [0, 1] if n == 2
  old_seq = fib_recursive(n - 1)
  old_seq + [old_seq[-2] + old_seq[-1]]
end

def subsets(arr)
  return [[]] if arr.empty?
  last_el = arr.last
  prev_set = subsets(arr[0...-1])
  new_set = prev_set.map { |el| el + [last_el] }
  prev_set + new_set
end

def permutations(arr)
  return [arr] if arr.length == 1
  first = arr.shift
  perms = permutations(arr)
  total_perms = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end
  total_perms
end

def binary_search(arr, num)
  return nil if arr.length == 0
  mid_index = arr.length / 2
  mid_element = arr[mid_index]
  return mid_index if mid_element == num
  if num > mid_element
    mid_index + 1 + binary_search(arr[mid_index + 1..-1], num)
  else
    binary_search(arr[0...mid_index],num)
  end
end

def merge_helper(arr1, arr2)
  merged = []
  until arr1.empty? || arr2.empty?
    if arr1.first > arr2.first
      merged << arr2.shift
    else
      merged << arr1.shift
    end
  end
  merged + arr1 + arr2
end

def merge_sort(arr)
  return arr if arr.length < 2
  mid_index = arr.length / 2
  arr1 = arr.take(mid_index)
  arr2 = arr.drop(mid_index)
  merge_helper(merge_sort(arr1), merge_sort(arr2))
end

def greedy_make_change(num, array)
  return [] if num == 0
  change = []
  array.each do |coin|
    if num > coin
      change << coin
    end
  end
  highest_coin = change.sort.first
  remainder = num - ((num/highest_coin) * highest_coin)
  coins = []
  coins << num/highest_coin
  greedy_make_change(remainder)
end
