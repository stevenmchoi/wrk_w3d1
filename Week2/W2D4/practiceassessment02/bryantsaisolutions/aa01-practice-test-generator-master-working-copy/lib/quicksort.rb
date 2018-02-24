class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    return self if self.length < 2
    prc = Proc.new { |l,r| l <=> r} unless block_given?
    pivot = self[self.length/2]
    
    left = []
    equal = []
    right = []

    self.each do |el|
      comp_result = prc.call(el,pivot)
      case comp_result
      when 1
        right << el
      when 0
        equal << el
      when -1
        left << el
      else
        raise "not a valid comparison block"
      end
    end

    sorted_left = left.my_quick_sort(&prc)
    sorted_right = right.my_quick_sort(&prc)

    sorted_left + equal + sorted_right
  end
  
end
