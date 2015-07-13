* `bundle exec rake test`
* `rails generate integration_test site_layout`
* `bundle exec rake test:integration`

Code | Matching HTML
-----|--------------
assert_select "div" | `<div>foobar</div>`
assert_select "div", "foobar" | `<div>foobar</div>`
assert_select "div.nav" | `<div class="nav">foobar</div>`
assert_select "div#profile" | `<div id="profile">foobar</div>`
assert_select "div[name=yo]" | `<div name="yo">hey</div>`
assert_select "a[href=?]", ’/’, count: 1 | `<a href="/">foo</a>`
assert_select "a[href=?]", ’/’, text: "foo" | `<a href="/">foo</a>`

* `bundle exec rake db:rollback`
* `rails c --sandbox`
   * "Loading development environment in sandbox (Rails 4.2.2)  
   Any modifications you make will be rolled back on exit"
* `bundle exec rake test:models`
* regexp chart:

Expression | Meaning
-----------|--------
`/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i` | full regex
`/` | start of regex
`\A` | match start of a string
`[\w+\-.]+` | at least one word character, plus, hyphen, or dot
`@` | literal “at sign”
`[a-z\d\-.]+` | at least one letter, digit, hyphen, or dot
`\.` | literal dot
`[a-z]+` | at least one letter
`\z` | match end of a string
`/` | end of regex
`i` | case-insensitive

* `rails g migration add_index_to_users_email`
* `rails g migration add_password_digest_to_users password_digest:string`
* `debugger` -- in `UsersController` -- via `byebug` gem -- opens mini console in rails server!
* ZOMG `redirect_to @user` now that is some real rails magic!
* `flash` is pretty sweet!

where last left off at end of ch7:
> In Chapter 8, we will complete our authentication machinery by allowing users to log in and out of the application. In Chapter 9, we will allow all users to update their account information, and we will allow site administrators to delete users, thereby completing the full suite of Users resource REST actions from Table 7.1.

therefore, __must complete chapters 8 & 9 to finish goal of testing out / playing with authentication implementation__

* `rails generate migration add_remember_digest_to_users remember_digest:string`
