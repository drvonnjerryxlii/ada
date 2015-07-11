class Word < String
  def palindrome?
    self == self.reverse
  end
end

# a = Word.new("racecar") # true
# b = Word.new("potato") # false
# c = "level" # NoMethodError
# d = "string" # NoMethodError

class String
  def palindrome?
    self == self.reverse
  end
end

# a = Word.new("racecar") # true
# b = Word.new("potato") # false
# c = "level" # true
# d = "string" # false
