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

bootstrap
* has a grid system that spans 12 columns
   * in a wide screen it might span all 12
   * in a smaller screen, it knows where to move columns to make things look good
* it uses classes
   * if you install bootstrap and don't add classes to your html, nothing will happen
* you can specify -- use 12 columns on an extra small device and 6 columns on a medium
   * by default it will optimize for smaller devices

font awesome

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-two ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day forty-three ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>
