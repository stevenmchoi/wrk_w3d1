# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n-1)
end


  # Test Cases
  sum_to(5)  # => returns 15
  sum_to(1)  # => returns 1
  sum_to(9)  # => returns 45
  sum_to(-8)  # => returns nil

# Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array)
  return nil if nums_array.length < 1
  return nums_array[0] if nums_array.length == 1
  nums_array.first + add_numbers(nums_array[1..-1])
end


  # Test Cases
  add_numbers([1,2,3,4]) # => returns 10
  add_numbers([3]) # => returns 3
  add_numbers([-80,34,7]) # => returns -39
  add_numbers([]) # => returns nil

# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors[0] == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

  # Test Cases
  ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  ice_cream_shop([], 'honey lavender')  # => returns false

# Write a function reverse(string) that takes in a string and returns it reversed.

def reverse(string)
  return "" if string.empty?
  string[-1] + reverse(string[0...-1])
end

  # Test Cases
  reverse("house") # => "esuoh"
  reverse("dog") # => "god"
  reverse("atom") # => "mota"
  reverse("q") # => "q"
  reverse("id") # => "di"
  reverse("") # => ""

def upcase(str)
  return "" if str.empty?
  (str[0].ord - 32).chr + upcase(str[1..-1])
end

#TODO: fix this method

# def downcase(str)
#   return "" if str.empty?
#   if (65..90) === str[0].ord
#     return (str[0].ord + 32).chr + upcase(str[1..-1])
#   else
#     return str[0] + upcase(str[1..-1])
#   end
# end

def downcase(str)
  p str.unpack('U*')
  str.unpack('U*').map! {|ltr| (ltr - 32).chr }
end

def reverse_words(sentence)
  return "" if sentence.empty?
  sentence.split.pop + " " + reverse_words(sentence.split[0...-1].join(' '))
end
