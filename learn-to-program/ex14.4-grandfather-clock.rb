require 'time'

def grandfather_clock (&block)
  hours_passed = Time.now.hour
  hours_passed -= 12 if hours_passed > 12

  hours_passed.times do
    block.call
  end
end

# grandfather_clock do
#   puts "DONG"
# end
#
# grandfather_clock do
#   puts "I've got a lovely bunch of coconuts, deedledee."
#   puts "Here they are standing in a row. Dun, dun, dun."
# end
