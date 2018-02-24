class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)
    prc = Proc.new { |l,r| l <=> r } unless block_given?
    return nil if self.empty?

    mid_index = self.length/2
    mid = self[mid_index]

    return mid_index if mid == target

    if prc.call(mid, target) == 1
      return self[0...mid_index].my_bsearch(target, &prc)
    else
      right_result = self[mid_index+1..-1].my_bsearch(target, &prc)
      right_result += mid_index + 1 unless right_result.nil?
      return right_result
    end
  end

end
