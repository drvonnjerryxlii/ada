sorted_list = [
  "a", "airplane", "an", "another", "apple", "barometer", "bringer", "brush",
  "burninator", "car", "circling", "colorific", "cthulhu", "curiousity",
  "darkness", "doorway", "drought", "eel", "elevator", "elf", "fiery", "forte",
  "furious", "gaping", "garage", "gripped", "halo", "highway", "hourly", "ice",
  "ideation", "insanity", "iota", "juice", "kale", "knack", "lair", "liver",
  "lucky", "lyre", "mathematician", "meat", "mired", "monstrous", "nargles",
  "no", "nutty", "orange", "ouroborous", "oval", "parry mason", "physicist",
  "pizza", "pringles", "quacks like a duck", "queer", "quiver", "railing",
  "realm", "riverside", "rocky", "sorcery", "source", "system", "talon", "tea",
  "tower", "tube", "umbrealla", "uno", "venue", "view", "voracious", "wearable",
  "wizard", "worship cthulhu", "xor", "xylem", "yes", "you", "zero", "zoology",
  "find x" # this is out of order! it might break the sort!
  ]

sorted_list.sort!


def binary_search(search_term, sorted_array)
  start_length = sorted_array.length - 1
  halfway_point = start_length / 2

  if start_length == 2
    check_here = sorted_array[1]
  elsif start_length == 1
    check_here = sorted_array[0]
  else
    check_here = sorted_array[halfway_point]
  end

  unless sorted_array.length <= 1
    bottom_half = sorted_array[0,halfway_point]
    check_here = sorted_array[halfway_point]
    top_half = sorted_array[halfway_point + 1,start_length]

    print "check: "
    print check_here
    print "\n\n"
    # print "\n\nbottom: "
    # print bottom_half
    # print "\n\ntop: "
    # print top_half

    if search_term == check_here
      # puts "equal"
      return true
    elsif search_term < check_here
      # puts "lesszors"
      return binary_search(search_term, bottom_half)
    elsif search_term > check_here
      # puts "morezors"
      return binary_search(search_term, top_half)
    else
      return false # your item isn't here
    end

  else
    if search_term == check_here
      return true
    else
      return false
    end
  end
end

puts binary_search("meat", sorted_list)
