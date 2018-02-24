class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    subwords = []
    (1..self.length).each do |substring_length|
      (0..(self.length - substring_length)).each do |start_index|
        substring = self[start_index, substring_length]
        subwords << substring if dictionary.include?(substring)
      end
    end
    subwords.uniq
  end
end
