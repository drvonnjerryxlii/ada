- - -
> ### jump links ###
- - -

* [day 25](#day-twenty-five)
* [day 26](#day-twenty-six)
* [day 27](#day-twenty-seven)
* [day 28](#day-twenty-eight)

- - -
> ### day twenty-five ###
- - -

weekend homework review
* `//` regexp did not need the whole error message, just a part that would confirm it was the right message (undefined method)

[http verbs][htvb]
* idempotency:
   * request does not in any way change the resource, just reading data & not
     changing it.
   * does not mean the content is the same! just means that the act of making
     the request does not change anything.
   * this is a design ideal. a GET request should never modify anything on the
     server.
* POST creates information on the server.
   * tweeting, emailing -- these are POST requests.
* PUT is like POST, but it's used to update existing resources.
   * considered idempotent, because multiple requests have one effect.
* DELETE. if you call this ten times in a row, you'll probably get a 404 error,
  and that resource will no longer exist.
* CRUD. create read update delete.

[submitting forms][forms]
* input: text, checkbox, radio, password, file, image, submit, hidden
   * hidden: for all the stuff the browser knows about the user that the user
     won't have to type in themselves.
* textarea - paragraph sized box instead of the single line input text.
* select - dropdowns.
* button v input type button - mostly for javascript.
* action is where it's being posted / put
* labels and inputs are paired with `for` and `id`
* placeholder v value
   * placeholders are hints
   * values are default values, like old values when doing a PUT

[ScrabbleSinatra][ss] paired w/ lila
* lila says html tab complete. just type `hmtl`, hit tab, enjoy magic.

HOMEWORK:
* ruby warrior 1-3

[htvb]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/http-verbs.md

[forms]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/submitting-forms.md

[ss]: https://github.com/Ada-Developers-Academy/C3Projects--ScrabbleSinatra

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day twenty-six ###
- - -

[more forms][forms2]
* fieldset
* wrapping label around its related input field

[forms2]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/checkboxes-and-radio-buttons.md

browser: `http://kitties.yay/kitty/watermel`
* `http` -- protocol
* `kitties.yay` -- domain
* `kitty/watermel` -- resource / request / path

sinatra: `get "/kitty/:name" do`
* `get "/kitty/:name"` -- route
* `get` -- verb
* `/kitty` -- namespace
* `/:name` -- query parameter

sinatra: `post "/kitty/:name" do`
* `post` -- different verb

business logic
* module layer

application logic
* sinatra (my_site) layer

display logic
* erb layer
* absolutely you can put a loop here _as long as its purpose is display_.


HOMEWORK:
* ruby warrior 4-6
* poodr chapter 4

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day twenty-seven ###
- - -

reviewed ruby warior levels 4-6

[intro to databases][db101]
* !Q is key-value like JSON?
* schema is the DB structure
   * tables of columns & rows
   * primary key is a __unique__ value used to identify each row
      * like a username or a row number
   * foreign key is the primary key from another row in another table
      * like a userID column in an address table pointing back to the primary
        key of userID in the users table
      * like the market id in vendor ([more detailedFarMar project example][fmex])
* structured query language (SQL):
   * create, drop, alter, etc - changing the table / schema itself
   * select, insert, update, delete, etc - refer only to records, to individual rows

[intro to sqlite][sql101]
* use ctrl+d to escape sqlite
* [more detailed notes][sqlplay]

HOMEWORK:
* finish 4-6 of ruby warrior && 4 of poodr if you haven't already

[db101]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/database/intro_to_db.md

[sql101]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/database/using_sqlite.md

[fmex]: https://github.com/drvonnjerryxlii/ada/blob/515bbc168e453cec61efb69eb8517c96f8a447b7/class-notes/detailed-notes/d027-farmar-detailed-primary-foreign-key-example.md

[sqlplay]: https://github.com/drvonnjerryxlii/ada/blob/515bbc168e453cec61efb69eb8517c96f8a447b7/class-notes/detailed-notes/d027-sqlite3-play.md

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day twenty-eight ###
- - -

ruby warrior 4-6 review.
in `wat_do`
* default action is `:walk!`
* if hurt || taking damage, action is `:rest!` instead.
* if space isn't empty, `:attack!` instead.
* all objects have a .send method. this is how we actually send methods between objects.
   * `2 + 3` send the plus message to the 2 object with 3 as a parameter
      * `2.send(:+, 3)`
   * in this case, `warrior.send(wat_do)`
      * `wat_do` sends a symbol like `:rest!`

reviewed poodr chapter 4.
* __public vs private__ as helpful hints for which things are likely to be
  changed and which things are safe for people to depend on / will have
  predictable, unchanging inputs and outputs.
* rspec tests should be for public methods. this means if you have user input
  validation methods, you should be testing via going through the path the user
  would, _not by testing the validation methods directly_.
   * user usually doesn't mean someone typing in bad input. it means another
     object.

sequence diagram example:
![](detailed-notes/d028-seqence-diagram-fr-stack-overflow)

[sosd]: http://stackoverflow.com/questions/1850096/using-quick-sequence-diagram-editor-for-sequence-diagrams

some notes from what chef was saying:
* ada extremely selective
   * hundreds of applicants across the country
   * selected to be one of twenty-four students
* where should we go from here? (continued learning)
* interested





<div align="right">^<a href="#jump-links">top</a></div>
