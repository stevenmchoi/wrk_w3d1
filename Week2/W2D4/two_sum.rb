# def two_sum?(arr, target_sum)
#     # your code here...
# end
#
# arr = [0, 1, 5, 7]
# two_sum?(arr, 6) # => should be true
# two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
  arr.sort!

  arr.each do |el|
    result = b_search(arr, target_sum - el)
    #result = arr.bsearch_index{|val| target_sum + val}
    result.nil? ? next : (return true)
  end

  false
end

def b_search(arr, target)
  return nil if arr.empty?

  mid_pt = arr.length / 2

  case arr[mid_pt] <=> target
  when -1
    b_search(arr[0...mid_pt], target)
  when 0
    return mid_pt
  when 1
    result = b_search(arr[mid_pt..-1], target)
    result.nil? ? nil : mid_pt + result + 1
  end
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be fal
