require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    start = 0
    if accumulator.nil?
      accumulator = self[0]
      start += 1
    end
    (start...self.length).each do |i|
      accumulator = yield(accumulator, self[i])
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |possible_factor|
    return false if num % possible_factor == 0
  end
  true
end

def primes(num)
  return [] if num < 1
  primes = []
  possible_prime = 2
  until primes.length == num
    primes << possible_prime if is_prime?(possible_prime)
    possible_prime += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return nil if num < 1
  return [1] if num == 1
  prev_factorials = factorials_rec(num-1)
  prev_factorials + [prev_factorials[-1] * (num-1)]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    index_hash = Hash.new
    self.each_with_index do |el, index|
      index_hash[el] = [] unless index_hash.include?(el)
      index_hash[el] << index
    end
    index_hash.select { |k,v| v.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def is_palindrome?
    self == self.reverse
  end

  def symmetric_substrings
    symmetric_substrings_found = []
    (2..(self.length)).each do |substring_length|
      (0..(self.length - substring_length)).each do |start_index|
        candidate_substring = self[start_index, substring_length]
        if candidate_substring.is_palindrome?
          symmetric_substrings_found << candidate_substring
        end
      end
    end
    symmetric_substrings_found
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc = Proc.new {|l,r| l <=> r} unless block_given?
    return self if self.length < 2
    middle_index = self.length/2
    left_half = self[0...middle_index]
    right_half = self[middle_index...self.length]
    sorted_left_half = left_half.merge_sort { |l,r| prc.call(l,r) }
    sorted_right_half = right_half.merge_sort { |l,r| prc.call(l,r) }
    
    Array.merge(sorted_left_half, sorted_right_half) { |l,r|
    prc.call(l,r) }
  end

  private
  def self.merge(left, right, &prc)
    left_index = 0
    right_index = 0
    merged_array = []
    until left_index == left.length || right_index == right.length
      left_el = left[left_index]
      right_el = right[right_index]

      if prc.call(left_el, right_el) == 1
        merged_array << right_el
        right_index += 1
      else
        merged_array << left_el
        left_index += 1
      end
    end

    (left_index...left.length).each do |i|
      merged_array << left[i]
    end
    (right_index...right.length).each do |i|
      merged_array << right[i]
    end
    
    merged_array
  end
end
