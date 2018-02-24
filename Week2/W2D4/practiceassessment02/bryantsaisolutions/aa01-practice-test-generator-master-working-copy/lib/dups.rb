class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_indices = Hash.new() { [] }
    self.each_with_index do |el, index|
      dup_indices[el] = (dup_indices[el] << index)
    end
    dup_indices.select { |k, array| array.length > 1 }
  end
end
