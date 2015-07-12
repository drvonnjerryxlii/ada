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

def string_shuffle(s)
  s.split('').shuffle.join
end

class String
  def shuffle
    self.split('').shuffle.join
  end
end
