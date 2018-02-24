require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    return false if include?(num)
    is_valid?(num) ? @store.unshift(num) : (raise "Out of bounds")
    true
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    (0...@store.length) === num
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % @store.length
    if include?(num)
      raise
    else
      #byebug
      @store[bucket_idx] << num
      true
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    else
      raise "no el"
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket_idx = num % @store.length
    @store[bucket_idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if count == num_buckets
      self[num] << num
      @count+=1
      true
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count-=1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    bucket_idx = num % @store.length
    @store[bucket_idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(@store.length * 2) { Array.new }
    new_len = new_arr.length

    @store.each do |bucket|
      bucket.each do |el|
        new_arr[el % new_len] << el
      end
    end
    @store = new_arr
  end
end
