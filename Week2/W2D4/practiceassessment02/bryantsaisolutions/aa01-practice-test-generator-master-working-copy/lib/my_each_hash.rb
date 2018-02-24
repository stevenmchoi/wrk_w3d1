class Hash

  # Write a version of my each that calls a proc on each key, value pair
  def my_each(&prc)
    flattened = self.flatten
    (0...self.length).each do |index|
      key = flattened[index * 2]
      value = flattened[(index * 2) + 1]
      prc.call(key, value)
    end
  end

end
