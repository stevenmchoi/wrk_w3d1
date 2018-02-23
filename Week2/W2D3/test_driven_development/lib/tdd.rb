class Array

  def my_uniq
    uniq = []
    each do |el|
      uniq << el unless uniq.include?(el)
    end
    uniq
  end

  def two_sum
    res = []
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        res << [i, j] if self[i] + self[j] == 0
        j+=1
      end
      i+=1
    end
    res
  end
end

def my_transpose(arr)
  transpose_arr = Array.new(arr.length) { [] }
  arr.each_with_index do |row, row_idx|
    row.each_with_index do |col_val, col_idx|
      transpose_arr[col_idx] << col_val
    end
  end
  transpose_arr
end

def stock_picker(arr)
  day_pair = []

  max = arr.max
  min = arr[0..arr.index(max)].min

  min2 = arr.min
  max2 = arr[arr.index(min2)..-1].max

  if (max - min) > (max2 - min2)
    [arr.index(min), arr.index(max)]
  else
    [arr.index(min2), arr.index(min2) + arr.index(arr[arr.index(min2)..-1].max)]
  end

end
