- - -
> ### jump links ###
- - -

* [day 39](#day-thirty-nine)
* [day 40](#day-forty)
* [day 41](#day-forty-one)
* [day 42](#day-forty-two)
* [day 43](#day-forty-three)

- - -
> ### day thirty-nine ###
- - -

reviewed homework
* take home assessment

[validations & error messages][verr]:

`<%= @albums.errors.each do |table_column_name, message| %>`  
....`<strong><%= table_column_name.capitalize %></strong>`  
....`<%= message %>`  
`<% end %>`

[next project (media ranker) begins][mdrk]
* solo project

[verr]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/validations.md
[mdrk]: https://github.com/Ada-Developers-Academy/C3Projects--MediaRanker

HOMEWORK:
* [better specs][bs]

[bs]: http://betterspecs.org/

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty ###
- - -

testing in rails
* https://github.com/rspec/rspec-rails
* https://www.relishapp.com/rspec/rspec-rails/docs/controller-specs
* THIS IS AWESOME: [jumpstart lab's rspec practices page][jslrspec]
   * `before :all` is also a thing!!!!1112six

[jslrspec]: http://tutorials.jumpstartlab.com/topics/internal_testing/rspec_practices.html

words:
* mentions of "factory girl" gem
* writing a positive and negative test for each scope or thing you're testing
   * eg, for records from a specific label -- a test for records that _should_ be from it and a test for records that _should not_
   * these are called unit tests
* HTTP status for redirect is 301
* controller testing by default _does not render the views_
   * but it does do the model & db stuff
* `rails g rspec:model album`
* `rails g rspec:controller albums`
* `rspec spec/models/album_spec.rb` -- only run spec in that file
* `rspec spec/controllers` -- only run specs in that folder

testing in rails live code
* in Gemfile:  
  `# Rspec rails tests helper gem`  
  `gem "rspec-rails", "~> 3.0"`  

  `# To add test code coverage statistics to rspec calls`  
  `gem "simplecov"`
* in spec_helper.rb:  
  `require "simplecov"`  
  `SimpleCov.start`
* added `coverage/` to `.gitignore`


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-one ###
- - -

[bootstrap][boots] ([exploration][myexp])
* has a grid system that spans 12 columns
   * in a wide screen it might span all 12
   * in a smaller screen, it knows where to move columns to make things look good
* it uses classes
   * if you install bootstrap and don't add classes to your html, nothing will happen
* you can specify -- use 12 columns on an extra small device and 6 columns on a medium
   * by default it will optimize for smaller devices
* `gem "bootstrap-sass", "~> 3.3.5"`
* in `application.css`  
  __rename to `application.scss`__  
  `@import "bootstrap-sprockets";`  
  `@import "bootstrap";`
* in `application.js`  
  `//= require bootstrap-sprockets` -- move the dot to the end of this line instead of the line about `tree`

[boots]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/bootstrap.md

[myexp]: https://github.com/drvonnjerryxlii/ada/tree/master/class-notes/detailed-notes/d041-bootstrap-101

http://getbootstrap.com/examples/theme/

font awesome

THE GREAT SUSPENDER!
* mystical TA recommended this chrome extension for keeping excess tabs from crashing yo' browser.
   * sounds amazing!

rspec tests that mess up the test database:
* `before :all` __does not clean up after itself in rspec rails testing__
* `before :each` clears out the records it creates

Jeremy's possible solutions to DAS PROBLEM
* `get root_path`
* `request.path.split('/')`
* NO DID NOT WORK :(

Jeremy's next possible solution to DAS PROBLEM
* `get '/:format', to: 'media#index', constraints: { format: ~~put regexp here~~}, as: 'taco'`
* he googled: `rails routes resources with query params`
* YYYEEEEESSSSSsss


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-two ###
- - -

ASHLEY IS WIZARD!
* `resources :books, controller: "media"`

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-three ###
- - -

more project time

`categories = Category.all.map { |category| category.plural }`
* Jeremy says this is a bad idea, because databases are not reliable.
* switching back to the old array version fixes the missing keys & table errors, so rails must agree.

cs fundamentals-- sorting and efficiency

ANITA IS ALSO A WIZARD~
* `@medium.reload` -- because of course to save memory things get cached from the database

SELF-ASSIGNED HOMEWORK:
* ~~need to add rails to my default gemset!~~ done
* then start [this project][thatproj]?
* write a blag post about what learned from routing hiccups, etc MediaRanker?
* ~~explore NASA Star API~~ [yes][space]
* try adding authentication to something?
   * decided to run through [rails tutorial][rtut]
   * [notes][myrtut]
* maybe clean up weekly notes to replace all the asdfkljasdf-y broken links with reality

[thatproj]: http://tutorials.jumpstartlab.com/projects/blogger.html

[space]: https://github.com/drvonnjerryxlii/ada/blob/master/space.md

[rtut]: https://www.railstutorial.org/

[myrtut]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d043-weekend-rails-tutorial-notes.md

INSTRUCTOR-ASSIGNED HOMEWORK:
* the odin project's [session, cookies, & authentication][topsca]

[topsca]: http://www.theodinproject.com/ruby-on-rails/sessions-cookies-and-authentication

<div align="right">^<a href="#jump-links">top</a></div>
