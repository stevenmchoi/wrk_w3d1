class Hash

  # Write a version of merge. This should NOT modify the original hash
  def my_merge(hash2)
    merged_hash = {}
    self.each do |k, v|
      merged_hash[k] = v
    end
    hash2.each do |k,v|
      merged_hash[k] = v
    end
    merged_hash
  end

end
