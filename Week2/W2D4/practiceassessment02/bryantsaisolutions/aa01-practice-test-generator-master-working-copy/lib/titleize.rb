# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'
def titleize_single_word(word)
  return word[0].upcase + word[1..-1]
end

def titleize(title)
  words_to_ignore = ['a', 'and', 'of', 'over', 'the']

  titleized_words = []
  words = title.split(' ')
  first = true
  words.each do |word|
    if first
      titleized_words << titleize_single_word(word)
      first = false
    elsif words_to_ignore.include?(word)
      titleized_words << word
    else
      titleized_words << titleize_single_word(word)
    end
  end

  titleized_words.join(' ')

end
