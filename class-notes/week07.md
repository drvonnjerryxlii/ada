- - -
> ### jump links ###
- - -

* [day 29](#day-twenty-nine)
* [day 30](#day-thirty)
* [day 31](#day-thirty-one)
* [day 32](#day-thirty-two)
* [day 33](#day-thirty-three)

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
[mytask]: https://github.com/drvonnjerryxlii/C3Projects--TaskList/tree/kja+js/master

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
* [my fork][mytlr] ([live][livetlr)

[tlr]: https://github.com/Ada-Developers-Academy/C3Projects--TaskListRails
[mytlr]: https://github.com/drvonnjerryxlii/C3Projects--TaskListRails/tree/js/master
[livetlr]: https://carls-taskmaster.herokuapp.com/

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-two ###
- - -

[better errors][berr]
* first we made a broken link to guarantee everyone would have a rails error page.
* added a couple lines to Gemfile.
   * `# make error messages more betterer`  
     `gem "better_errors"`  
     `gem "binding_of_caller"`
* bundled.
* added a route to broken link (but not a view or method).
* viola! fancy new error message, courtesy of better errors.

awesome better errors stuff:
* stack trace
   * click on parts of the stack to see the bits of code executed!
   * then move to live shell to play aronud with the code, see what's happening.
* live shell thing!!!! <3  
  typing in variables and seeing exactly what they are at this point in the stack.  
  sooo awesome! n_n
   * `action_name` nil
   * `action` "broken_link"
   * `self` long huge object
* also request info, local variables, instance variables detailed info below!
   * `_request` and `_env` look like all the browser/http stuff! check it out:
      * `"PATH_INFO"=>"/broken_link"`
      * `"HTTP_CONNECTION"=>"keep-alive"`
      * `"REQUEST_URI"=>"http://localhost:3000/broken_link"`
      * `"SERVER_PORT"=>"3000"`
      * `"SERVER_SOFTWARE"=>"WEBrick/1.3.1 (Ruby/2.2.2/2015-04-13)"`
      * `"HTTP_USER_AGENT"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36"`

[berr]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/rails-request-state.md

[rails forms][rforms]
[params & session][p&s]

[rforms]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/rails-forms.md
[p&s]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/params-and-session.md

live coding
* p = Proposal.new(params.permit(proposal: [:title, :abstract]))
* p = Proposal.new(params.permit(proposal => [:title, :abstract]))
* `def create`  
  ....`@proposal = Proposal.new(create_params[:proposal])`  
  ....`@proposal.save`
  .  
  ....`render :thank_you`  
  `end`  
  .  
  `private`  
  .  
  `def create_params`  
  ....`params.permit(proposal: [:title, :abstract])`  
  `end`


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-three ###
- - -

[STACKS AND QUEUES][s&q]

[s&q]: https://docs.google.com/presentation/d/1rsxjS8l4Lo21nskccyBH7Hap19NfL-D1BNGgiPlW0bc/edit

abstract data types
* in computer science, an abstract data type (ADT) is a way of storing data that is defined by its behavior from the point of view of a user of the data, sepcifically in terms of: possible values, possible operations on data of this type, and the behavior of these operations.

ADTs
* native arrays, linked list, tree, set, map, hash, bag, graph, heap, stack and queue, etc
* two generally tested in interview: linked list & tree

STACK
* LIFO - last in first out
* a collection of items in which only the most recently added item may be removed.
* the only book you can take from a stack without knocking it over is the one on the top.

QUEUE
* FIFO - first in first out
* a collection of items in which the first items entered are the first items removed.
* the first car into the freeway exit gets off first.

STACK OPERATIONS - LIFO
* `push(e)` push an element onto the stack
* `pop()` take top item off
* `empty?()`
* `top()` sometimes called `peak` - just tells you the top item
* `size()` tells you how many are there

QUEUE OPERATIONS - FIFO
* `enqueue(e)` adds an element to the end
* `dequeue()` removes from the front
* `empty?()`
* `front()` tells you the item at the front of the queue (first to be removed)
* `size()` tells you how many are there

USING A STACK
printer example
* printers often print in reverse order so the first page will be on the top

USING A QUEUE
still a printer
* printers take jobs in as a queue
* the first job in will be printed first
* the last job in will be printed last

RUBY MONK EXERCISE
* [my stack solution][mys]

[mys]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d033-stack.rb



<div align="right">^<a href="#jump-links">top</a></div>
