require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if count == @store.length
      self[key] << key
      @count+=1
      true
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count-=1
    end
  end

  private

  def [](num)
    bucket_idx = num.hash % @store.length
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
        new_arr[el.hash % new_len] << el
      end
    end
    @store = new_arr
  end
end
