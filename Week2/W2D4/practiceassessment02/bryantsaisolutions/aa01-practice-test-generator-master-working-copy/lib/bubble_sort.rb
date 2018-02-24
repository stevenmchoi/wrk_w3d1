class Array
  def bubble_sort!(&prc)
    prc = Proc.new { |l,r| l <=> r } unless block_given?
    sorted = false
    until sorted
      sorted = true
      (0...(self.length - 1)).each do |l_index|
        r_index = l_index + 1
        if prc.call(self[l_index], self[r_index]) == 1
          sorted = false
          self[l_index], self[r_index] = self[r_index], self[l_index]
        end
      end
    end

    self
  end

  def bubble_sort(&prc)
    clone = self.dup
    clone.bubble_sort!
  end
end
