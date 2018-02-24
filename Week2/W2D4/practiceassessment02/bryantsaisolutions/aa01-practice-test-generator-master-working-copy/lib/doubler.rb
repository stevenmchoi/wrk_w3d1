# Write a method that doubles each element in an array
def doubler(array)
  doubled_array = []
  array.each { |el| doubled_array << (el * 2) }
  doubled_array
end
