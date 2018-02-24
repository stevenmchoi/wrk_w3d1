# Write a method that returns the factors of a number in ascending order.

def factors(num)
  facs = []
  (1..num).each { |n| facs << n if num % n == 0 }
  facs
end
