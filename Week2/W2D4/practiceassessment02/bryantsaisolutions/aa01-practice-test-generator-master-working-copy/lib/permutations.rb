# Write a recursive method that returns all of the permutations of an array
def permutations(array)
  return [] if array.empty?
  return [array] if array.length == 1 
  perms = []

  array.each_with_index do |el, index|
    
    other_els = array[0...index] + array[index+1..-1]
    sub_perms = permutations(other_els)
    sub_perms.each do |perm|
      perms << ([el] + perm)
    end

  end
  
  perms
end
