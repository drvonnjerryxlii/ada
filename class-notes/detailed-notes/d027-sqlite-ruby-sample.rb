require "sqlite3"

# def display_table(nested_table_arrays)
#   nested_table_arrays.each do |row_array|
#     print row_array
#   end
# end

def create_database
  @db = @db ? @db || SQLite3::Database.new "d027-test.db"
end

@db.execute "CREATE TABLE posts(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT
  );"

@db.execute "INSERT INTO posts (title, body) VALUES ('unigoats', 'half goat, half horn');"
@db.execute "INSERT INTO posts (title, body) VALUES ('unicorns', 'half corn, half horn');"
@db.execute "INSERT INTO posts (title, body) VALUES ('unicows', 'half cow, half horn');"
@db.execute "INSERT INTO posts (title, body) VALUES ('unicamels', 'half camel, half horn');"
@db.execute "INSERT INTO posts (title, body) VALUES ('unipotatoes', 'half potato, half horn');"
@db.execute "INSERT INTO posts (title, body) VALUES ('unifruits', 'half fruit, half horn');"
last_row_id = @db.last_insert_row_id

puts last_row_id

@db.close if @db
