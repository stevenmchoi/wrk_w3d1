class Array

  def my_zip(*arrs)
    zipped_arrays = []
    self.each_with_index do |el, ind|
      zipped_array = [el]
      arrs.each do |arr|
        zipped_array << arr[ind]
      end
      zipped_arrays << zipped_array
    end
    zipped_arrays
  end
  
end
