# Write a recursive method that takes in a base 10 number n and
# converts it to a base b number. Return the new number as a string
#
# E.g. base_converter(5, 2) == "101"
# base_converter(31, 16) == "1f"

def base_converter(num, b)
  return "" if num == 0
  numeral_set = []
  (0..9).each do |numeral|
    numeral_set << numeral
  end
  ("a".."z").each do |numeral|
    numeral_set << numeral
  end

  last_digit = num % b
  converted_last_digit = numeral_set[last_digit]
  string_rep = converted_last_digit.to_s

  remaining_digits = num/b

  base_converter(remaining_digits, b) + string_rep

end
