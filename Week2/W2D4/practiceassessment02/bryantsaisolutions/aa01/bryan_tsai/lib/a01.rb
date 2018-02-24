# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.
def binary_search(arr, target)
  return nil if arr.empty?

  mid_index = arr.length/2
  mid = arr[mid_index]
  return mid_index if mid == target

  left = arr[0...mid_index]
  right = arr[(mid_index+1)...arr.length]

  if mid < target #search right
    #account for shifting indices
    result = binary_search(arr[mid_index+1...arr.length], target)
    result += mid_index + 1 unless result.nil?
    return result
  else #search left
    return binary_search(arr[0...mid_index], target)
  end
end

class Array
  # Write an array method that returns `true` if two elements of the array sum
  # to 0 and `false` otherwise
  def two_sum
    (0...(self.length-1)).each do |left_index|
      ((left_index+1)...self.length).each do |right_index|
        return true if self[left_index] + self[right_index] == 0
      end
    end
    false
  end
end

# Write a method that finds the first `n` Fibonacci numbers recursively.
def fibs_rec(count)
  return [0] if count == 1
  return [0,1] if count == 2
  prev_fibs = fibs_rec(count-1)
  prev_fibs << (prev_fibs[-1] + prev_fibs[-2])
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    other_word_count = Hash.new(0)
    other.split(" ").each do |word|
      other_word_count[word] += 1
    end

    self_word_count = Hash.new(0)
    self.split(" ").each do |word|
      self_word_count[word] += 1
    end

    self_word_count.each do |k,v|
      return false unless other_word_count[k] == v
    end
    
    other_word_count.each do |k,v|
      return false unless self_word_count[k] == v
    end

    true
  end
end

def is_prime?(num)
  (2...num).each do |possible_factor|
    return false if num % possible_factor == 0
  end
  true
end

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n.zero?
  count = 1
  curr = 2
  until count == n
    curr += 1
    count += 1 if is_prime?(curr)
  end
  curr
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    (0...self.length).each do |index|
      prc.call(self[index])
    end
    self
  end
end

class Array
  # Write a method that returns the first element that causes the passed block
  # to evaluate to `true`
  def my_find(&prc)
    self.each do |el|
      return el if prc.call(el)
    end
    nil
  end
end

