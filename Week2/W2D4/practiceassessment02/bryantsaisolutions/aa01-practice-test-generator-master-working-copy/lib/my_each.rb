class Array

  def my_each(&prc)
    (0...self.length).each do |index|
      prc.call(self[index])
    end
    self
  end

  def my_each_with_index(&prc)
    (0...self.length).each do |index|
      prc.call(self[index], index)
    end
  end
  
end
