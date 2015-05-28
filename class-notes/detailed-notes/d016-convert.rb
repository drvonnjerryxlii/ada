CONVERSIONS = [
  [1000, "M"],
  [900,  "CM"],
  [500,  "D"],
  [400,  "CD"],
  [100,  "C"],
  [90,   "XC"],
  [50,   "L"],
  [40,   "XL"],
  [10,   "X"],
  [9,    "IX"],
  [5,    "V"],
  [4,    "IV"],
  [1,    "I"]
]

def get_conversion_for(original_number)
  numeral = CONVERSIONS.find do |arabic, roman|
    # roman numerals are built from largest to smallest
    # 15 --> XV, X biggest that's less than original number, V next biggest, etc
    arabic <= original_number
  end

  return numeral
end

def convert(original_number)
  # guard clause for zero / base case
  return "" if original_number == 0

  # do the conversion for the n we have
  # get_conversion_for returns an array like [10, "X"]
  arabic, roman = get_conversion_for(original_number)

  # then the recursion
  return roman + convert(original_number - arabic)
end

#1000, 2015, 555, and 3467
puts convert(1000) # http://romannumerals.babuo.com/M-roman-numerals
puts convert(2015) # http://romannumerals.babuo.com/MMXV-roman-numerals
puts convert(555) # http://romannumerals.babuo.com/DLV-roman-numerals
puts convert(3467) # http://romannumerals.babuo.com/MMMCDLXVII-roman-numerals
