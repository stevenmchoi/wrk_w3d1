# Write a method that returns the median of elements in an array
# If the length is even, return the average of the middle two elements
class Array
  def median
    return nil if self.empty?

    sorted = self.sort
    mid_index = self.length/2
    if self.length.even?
      return (sorted[mid_index-1] + sorted[mid_index])/2.0
    else
      return sorted[mid_index]
    end
  end
end
