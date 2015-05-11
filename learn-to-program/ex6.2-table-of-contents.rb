# my file seemed like it was already qualified for 8.3, so I didn't redo it.

# stores table of contents & spits it out when necessary
def load_table_of_contents
    preface = {
      id: 0,
      title: "An Introduction To This Book",
      location: "vii"
    }
    chapter_1 = {
      id: 1,
      title: "Getting Started",
      location: 3
    }
    chapter_2 = {
      id: 2,
      title: "Moving Forward",
      location: 15
    }
    building_up = {
      location: 36,
      id: 3,
      title: "Building Up"
    }
    together = {
      location: 53,
      id: 4,
      title: "Putting It All Together"
    }
    chapter_5 = {
      location: 84,
      id: 5,
      title: "Further Resources"
    }
    six = {
      title: "Appendix",
      location: 90,
      id: 6
    }

    table_of_contents = [preface, chapter_1, chapter_2, building_up, together,
    chapter_5, six]

    return table_of_contents
end


# prints table of contents to screen
def print_table_of_contents(table_array)
  id_width = 20
  title_width = 50
  location_width = 10
  full_width = id_width + title_width + location_width

  puts "Table of Contents".center(full_width)
  puts "-" * full_width

  table_array.each do |content|
    current_line = ""

    if content[:id] == 0
      current_line += "Preface".ljust(id_width)
    else
      current_line += ("Chapter #{content[:id]}").ljust(id_width)
    end

    current_line += content[:title].ljust(title_width)
    current_line += "page #{content[:location]}".ljust(location_width)

    puts current_line
  end

end


# calls printing table of contents to screen on result of calling load table of
# contents.
print_table_of_contents(load_table_of_contents)
