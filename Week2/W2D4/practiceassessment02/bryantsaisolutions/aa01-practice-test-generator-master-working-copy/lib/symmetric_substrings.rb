class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.
  def is_palindrome?
    self == self.reverse
  end 

  def symmetric_substrings
    sym_substrings_found = []
    (2..self.length).each do |substring_length|
      (0..(self.length-substring_length)).each do |start_index|
        substring = self[start_index, substring_length]
        sym_substrings_found << substring if substring.is_palindrome?
      end
    end
    sym_substrings_found
  end
end
