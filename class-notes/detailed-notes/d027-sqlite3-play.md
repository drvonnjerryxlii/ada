
the names of the columns must be unique.
types: null, integer, real, text, blob.
* blobs generally only used for huge chunks of data, like an entire `html` page.

different database schemas have different data types.
* MySQL, Oracle's SQL products, Microsoft's SQL products -- they all have
  slightly different data types.
* Microsoft SQL products have var chars, chars, decimals, a ton of different
  types. this can be useful for data integrity / validation, but for now we want
  something simple.

`> CREATE TABLE posts(`  
`..> id INTEGER PRIMARY KEY,` this is the _unique_ identifier column! __don't allow duplicate values.__  
`..> title TEXT NOT NULL,` when you check for data integrity, make sure this
  value is _not null_. __don't__ insert data into this table unless this field is
  _not null_.  
`..> body TEXT`  
`..>);`  
`> SELECT title FROM posts;`  
`> SELECT title, body FROM posts;`  
`> SELECT * FROM posts;` empty tables won't return anything  
`> SELECT * FROM mr_potato_head;` nonexistent tables return errors  

> `Error: no such table: mr_potato_head`  

`> SELECT mr_potato_head from posts;`  nonexistent columns return errors

> `Error: no such column: mr_potato_head`  

`> INSERT INTO posts(title, body) VALUES('hello','world');`  
`> INSERT INTO posts(title, body) VALUES("I'm a title title I'm okay",'I work all night and I sleep all day!');`  
`> INSERT INTO posts(id, body, title) VALUES(22, 'body123', 'title123');`  
`> INSERT INTO posts(id, body, title) VALUES(22, 'body1234', 'title1234');`  

> `Error: UNIQUE constraint failed: posts.id`  

`> INSERT INTO posts(id, body, title) VALUES(3, 'body1234', 'title1234');`
`> INSERT INTO posts(title, body) VALUES('hello','world');` this is now id 23  
`> INSERT INTO posts(title, body) VALUES('hello','world');` this is now id 24  
`> SELECT * FROM posts`

id | title | body
---|-------|-----
1 | hello | world
2 | I'm a title title I'm okay | I work all night and I sleep all day!
3 | title1234 | body1234
22 | title123 | body123
23 | hello | world
24 | hello | world

`> UPDATE posts SET body='hi' WHERE id='23';`  
`> UPDATE posts SET body='hihihi' WHERE id='24';`  
`> SELECT * FROM posts`

id | title | body
---|-------|-----
1 | hello | world
2 | I'm a title title I'm okay | I work all night and I sleep all day!
3 | title1234 | body1234
22 | title123 | body123
23 | hello | hi
24 | hello | hihihi

`> DELETE FROM posts WHERE id=23;`  
`> SELECT title,body FROM posts WHERE id=2;`

title | body
------|-----
I'm a title title I'm okay | I work all night and I sleep all day!

`> INSERT INTO posts(body) VALUES('I AM THE BEST BODY THAT EVER EXISTED');`

> `Error: NOT NULL constraint failed: posts.title` title cannot be empty!

`> INSERT INTO posts(title) VALUES('I AM THE BEST BODY THAT EVER EXISTED');`  
`> SELECT * FROM posts`

id | title | body
---|-------|-----
1 | hello | world
2 | I'm a title title I'm okay | I work all night and I sleep all day!
3 | title1234 | body1234
22 | title123 | body123
24 | hello | hihihi
25 | I AM THE BEST BODY THAT EVER EXISTED |

`> ALTER TABLE posts ADD COLUMN beans INTEGER;`  
`> SELECT * FROM posts`

id | title | body | beans
---|-------|------|------
1 | hello | world |
2 | I'm a title title I'm okay | I work all night and I sleep all day! |
3 | title1234 | body1234 |
22 | title123 | body123 |
24 | hello | hihihi |
25 | I AM THE BEST BODY THAT EVER EXISTED | |

`> UPDATE posts SET beans=255;`  
`> SELECT * FROM posts`

id | title | body | beans
---|-------|------|------
1 | hello | world | 255
2 | I'm a title title I'm okay | I work all night and I sleep all day! | 255
3 | title1234 | body1234 | 255
22 | title123 | body123 | 255
24 | hello | hihihi | 255
25 | I AM THE BEST BODY THAT EVER EXISTED | | 255

`> SELECT * FROM posts WHERE id>20 LIMIT 2;`

id | title | body | beans
---|-------|------|------
22 | title123 | body123 | 255
24 | hello | hihihi | 255
