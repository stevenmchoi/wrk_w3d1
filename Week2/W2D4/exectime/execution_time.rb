require 'byebug'
#
# def my_min(arr)
#   min_val = arr.first
#   arr.each_with_index do |el, idx|
#     arr.each_with_index do |el2, idx2|
#       next if idx == idx2
#       min_val = el2 if el2 < el
#     end
#   end
#   min_val
# end
# # This will be O(n^2)
# def my_min(arr)
#   min_val = arr.first
#     arr.each_index do |idx|
#       min_val = arr[idx+1] if arr[idx+1] < arr[idx]
#     end
#   min_val
# end
# # This will be O(n)

# def largest_contig_sum(list)
#   sub_arrs = []
#
#   (0..list.length-2).each do |idx|
#     (idx+1...list.length).each do |idx2|
#       sub_arrs << list[idx..idx2]
#     end
#   end
#   p sub_arrs
#
#   sub_arrs.sort_by { |arr| arr.reduce(&:+) }.last
#
# end
#
# puts largest_contig_sum([2, 3, -6, 7, -6, 7])
# time complexity: O(n^2)

# def largest_contig_sum(list)
#   max_sum = list.first
#   max_sum_arr = [list.first]
#   temp_sum = max_sum
#
#   list.each_with_index do |el, idx|
#     next if idx == 0
#
#     if el + temp_sum > max_sum
#       max_sum = el + max_sum
#       max_sum_arr << el
#       temp_sum = max_sum
#     else
#       temp_sum = 0
#     end
#   end
#   max_sum_arr
# end
# This algorithm(If it worked) would be O(n), space: O(1)

# PHASE I
# def first_anagram?(string1, string2)
#   perms = string1.chars.permutation(string1.length).to_a
#
#   perms.map { |el| el.join }.include? string2
# end
# This algorithm is O(n!)
#
# puts first_anagram?("gizmo", "sally")
# puts first_anagram?("elvis", "lives")

def second_anagram?(string1, string2)
  string1.each_char do |chr|
    string1.delete!(chr) if string2.include? chr
  end

  string2.each_char do |chr|
    string2.delete!(chr) if string1.include? chr
  end

  return true if string1.empty? && string2.empty?
  false
end

puts second_anagram?("elvis", "lives")
puts second_anagram?("sally", "burger")
# PHASE II
# def first_anagram?(string1, string2)
#   str1 = string1.chars
#   str2 = string2.chars
#   # byebug
#   str1.each_index do |idx|
#     letter = str1[idx]
#     location = str2.index(letter)
#     next if location.nil?
#     str1.delete_at(idx)
#     str2.delete_at(location)
#
#     # puts str1.join
#     # puts str2.join
#   end
#   puts str1.join
#   puts str2.join
#
#   return true if str1.empty? && str2.empty?
#   false
# end
#
# #puts first_anagram?("gizmo", "sally")
# puts first_anagram?("elvis", "lives")

# PHASE III
# def third_anagram?(string1, string2)
#   string1.split(//).sort == string2.split(//).sort
# end
# This algorithm is O(a log a + b log b) = O(n log n)
#


# PHASE IV
def fourth_anagram?(string1, string2)
  str1 = Hash.new(0)
  str2 = Hash.new(0)

  string1.each_char do |chr|
    str1[chr] += 1
  end

  string2.each_char do |chr|
    str2[chr] += 1
  end

  str2.all? { |k,v| str1[k] == v } && str1.all? { |k,v| str2[k] == v }
end
#This algorithm is O(a + b) = O(n) time complexity, O(a + b) = O(n) space
# puts first_anagram?("gizmo", "sally")
# puts first_anagram?("elvis", "lives")
