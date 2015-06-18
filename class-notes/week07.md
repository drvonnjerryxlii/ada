- - -
> ### jump links ###
- - -

* [day 29](#day-twenty--nine)
* [day 30](#day-thirty)
* [day 31](#day-thirty--one)
* [day 32](#day-thirty--two)
* [day 33](#day-thirty--three)

- - -
> ### day twenty-nine ###
- - -

interesting forms stuff from our slack team:
* http://diveintohtml5.info/forms.html

[sequence diagrams!][seq]
* http://www.agilemodeling.com/artifacts/sequenceDiagram.htm
* https://files.slack.com/files-pri/T04UNMRH4-F06C04EH2/3littlepigs.png

continued working on task list project
* [my pair's][mytask]

amazon & spare5 presentations
* <3

[seq]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/sequence_diagrams.md
[mytask]: asdfasdf

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty ###
- - -

this is a sanitizing syntax. the question mark tells the sqlite3 gem to sanitize the input.
* `statement = "INSERT INTO tasks (name, description) values (?, ?)"`
   * why no ;?
* `values = [ params[:name], params[:desc] ]`
* `query! statement,values`

sql injection is the MOST COMMON type of attack on web apps.
* wordpress is especially vulnerable to sql injection.
* !Q sql injection markdown file url??
   * [not it but interesting][sec]

[sec]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/ca4fca54373334670842d5b465097f761fcd32b2/topic_resources/security.md

also discussed:
* [restful routes][rest]
* [mvc][mvc]
* [rails 101][rails]

[rest]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/resources/restful-routes.md
[mvc]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/resources/intro-to-mvc.md
[rails]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails.md

sandbox setup:
* `gem install rails --no-rdoc --no-ri`
   * `gem install rails -v4.0 --no-ri --no-rdoc`
* `rails new rails-blog -T`
* `rails generate controller carl`
   * class did `lunchtime`, but I thought `carl` was a cooler name
* `root 'welcome#index'` (`root 'carl#index'`)  
  `# the left half is the name of the controller for this route`  
  `# the right half is the name of the method for this route`
   * `root` here is basically shorthand for `get "/"`
* in CarlController (`rails-blog > app > controllers > carl_controller.rb`) defined `index` method.
* in CarlController's views (`rails-blog > app > views > carl`), created `index.erb`.
* `rails server`

screen hero
* awesome prog Jeremy was using while troubleshooting / trying to debug w/ Karri (sp?)
* apparently bought out by slack and shut down, but supposed to be up again someday..?

[data modeling whiteboard exercise][wbnotes]

[solo or group (at will) whiteboarding exercise][wb]
* I did the hotel set. [photo here][mywb]

[wbnotes]: asdfasf
[wb]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/kab/rails/topic_resources/data-modeling-exercise.md
[mywb]: asfasdf

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-one ###
- - -

re: yesterday's troubles
* `class` is a protected word!
* when we generated the students with name, __class__, and birthday fields, the class field broke everything.
* fix: we swapped _class_ for _cohort_. problems immediately solved.

resources:
* [activerecord 1][ar1]
* [activerecord 2][ar2]
* [controllers][cont]
* [routes][rots]
* [views 101][v101]

[ar1]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/active-record.md
[ar2]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/active-record-practice.md
[cont]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/controllers.md
[rots]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/routes.md
[v101]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/views-101.md

new project:
* [task list -- rails version!][tlr]
* [my fork][mytlr]

[tlr]: asdfasdf
[mytlr]: asdfasdf

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-two ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-three ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>
