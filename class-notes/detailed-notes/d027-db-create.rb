require "sqlite3"

db = SQLite3::Database.open "d027-test.db"
# db.execute "CREATE TABLE messages
  # (id INTEGER PRIMARY KEY, sender_name TEXT NOT NULL, reply_to TEXT NOT NULL,
  # subject TEXT NOT NULL, body TEXT NOT NULL, tags TEXT);"

# db.execute "INSERT INTO messages(sender_name, reply_to, subject, body)
#   VALUES('Aneda', 'Aneda.Wong@sbemail.com', 'Looking into the abyss, I find reflections of myself.', 'as fa jsdf;lkaj ge;ljrh aehug alifuhas ldkjfh asdf sdflkajhsfuweh walifuhaw eiufh 947 t3947 vr8347b r3u4h r34uf 394uncf 4 394g t3y4gt iugt 398g4 t9374gu 934gu7 r934gu7 349uh 3w9uh w9u hw9uh x9wu3 9734 c937 t97g c937g.')"
#
# db.execute "INSERT INTO messages(sender_name, reply_to, subject, body, tags)
#   VALUES('Brandee', 'Brandee.Vilson@sbemail.com', 'The darkness of the abyss consumes me.', 'as fa jsdf;lkaj ge;ljrh aehug alifuhas ldkjfh asdf sdflkajhsfuweh walifuhaw eiufh 947 t3947 vr8347b r3u4h r34uf 394uncf 4 394g t3y4gt iugt 398g4 t9374gu 934gu7 r934gu7 349uh 3w9uh w9u hw9uh x9wu3 9734 c937 t97g c937g.', 'madness, cthulhu, forks')"
#
# db.execute "INSERT INTO messages(sender_name, reply_to, subject, body, tags)
#   VALUES('Eelia', 'Electric.Eelia@sbemail.com', 'Even those of us below the sea were affected by the summoning of the abyss, the great old ones. They came from the sea.', 'as fa jsdf;lkaj ge;ljrh aehug alifuhas ldkjfh asdf sdflkajhsfuweh walifuhaw eiufh 947 t3947 vr8347b r3u4h r34uf 394uncf 4 394g t3y4gt iugt 398g4 t9374gu 934gu7 r934gu7 349uh 3w9uh w9u hw9uh x9wu3 9734 c937 t97g c937g.', 'cthulhu, potartoes, madness, the abyss, they came from the sea')"

# db.execute "INSERT INTO messages(sender_name, reply_to, subject, body)
#   VALUES('Aneda', 'Aneda.Wong@sbemail.com', 'sdkh jldgfkjhlag kjh lsad kjhlasgag ihuar giuhera gihuegr sihus gerl i uhs egrlhui.', 'as fa jsdf;lkaj ge;ljrh aehug alifuhas ldkjfh asdf sdflkajhsfuweh walifuhaw eiufh 947 t3947 vr8347b r3u4h r34uf 394uncf 4 394g t3y4gt iugt 398g4 t9374gu 934gu7 r934gu7 349uh 3w9uh w9u hw9uh x9wu3 9734 c937 t97g c937g.')"

# db.execute "DELETE FROM messages WHERE id=2"

select_statement = db.prepare "SELECT * FROM messages;"
results = select_statement.execute

results.each do |row|
  output = ""
  row.each do |cell|
    output += cell.to_s
    unless cell = row.last
      output += " | "
    end
  end
  print output
  print "\n\n"
end

results.close if results

db.close if db
