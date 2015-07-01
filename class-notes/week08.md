- - -
> ### jump links ###
- - -

* [day 34](#day-thirty--four)
* [day 35](#day-thirty--five)
* [day 36](#day-thirty--six)
* [day 37](#day-thirty--seven)
* [day 38](#day-thirty--eight)

- - -
> ### day thirty-four ###
- - -

reviewed weekend homework:
* official word: blocks & procs are closures

whoops. went looking for something I thought I remembered from eloquent javascript [but found this instead][jsint].
* [maybe this?][ejs1ch6]
* > If you're already familiar with JavaScript basics (variables, functions,
    objects, for-loops, while-loops) then Code School's JavaScript Road Trip 3
    will painlessly introduce you to closures and callbacks, including use cases
    and avoiding "gotchas." Their code challenges not only help you practice
    writing closures to build them into muscle memory but also help you begin to
    develop a sense for when to use them and why.  
    [source][qtsrc], [code school javascript road trip 3][csjsrt3]
* also found [this set of problems][this].

[jsint]: http://www.sitepoint.com/5-javascript-interview-exercises/
[ejs1ch6]: http://eloquentjavascript.net/1st_edition/chapter6.html
[qtsrc]: https://www.quora.com/I-have-an-interview-with-Hack-Reactor-in-about-a-week-I-need-to-be-familiar-with-closures-and-callbacks-Beyond-reading-about-them-I-have-minimal-experience-working-with-them-How-should-I-go-about-getting-a-solid-understanding-of-them-and-get-practice-using-them
[csjsrt3]: https://www.codeschool.com/courses/javascript-road-trip-part-3
[this]: https://github.com/codingfitness/codingfitness

people shared their tasklist stuff.

active record relationships:
* `rake db:reset`
* has_many :whatever
   * !Q !R whatever(force_reload = true) ?
   * association(force_reload = true)

project time for final wave.

envestnet talk.

project time.

moz talk.

task list rails setup:
* `group :development`  
  ....`gem 'sqlite3'`  
  `end`
* `group :production do`  
  ....`gem 'pg'`  
  `end`
* deleted stupid sqlite3 line in Gemfile that was outside the development group
* `heroku config:set BUNDLE_WITHOUT="development:test"`
* `heroku run rake db:migrate`
* `heroku run rake db:seed`

when you F up your production database and find you cannot `heroku run rake db:drop` (or `db:reset`):
* `heroku pg:reset DATABASE`
* `heroku run rake db:migrate`
* `heroku run rake db:seed`
* `heroku restart`


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-five ###
- - -

reviewed homework.

discussed:
* [agile & waterfall methodologies][agile]
* kanban systems
   * trello -- we will use this for FarMar this week.
* [advanced routing][r102]
   * [my notes from our playing around in stuff.][my102play]

after lunch:
* project intro: [far mar 2.0][twofar]
* project time: [ours][myfm2]

[agile]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/agile.md
[r102]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/routes-102.md
[r102play]: asdf asdf
[twofar]: https://github.com/Ada-Developers-Academy/C3Projects--FarMarRails
[myfm2]: asfasdfasdf

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-six ###
- - -

more farmar project time. :)

rails for zombies validation:
* `validates_presence_of :status`
* `validates_numericality_of :fingers`
* `validates_uniqueness_of :toothmarks`
* `validates_confirmation_of :password`
* `validates_acceptance_of :zombification`
* `validates_length_of :password, minimum: 3`
* `validates_format_of :email, with: /regex/i`
* `validates_inclusion_of :age, in: 21..99`
* `validates_exclusion_of :age, in: 0...21,`
* `validate :name, presence: true, uniqueness: true`



<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-seven ###
- - -

heroku limits:
* 10,000 rows :(

[style guide][stgd] discussion:
* use heredocs for long strings

HOMEWORK:
* rails for zombies 4

[stgd]: https://github.com/Ada-Developers-Academy/ruby-style-guide

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-eight ###
- - -

presentations
* `number_to_currency` helper!
* brittany kari refresh header photo changes
   * selected random index from array of image urls and then displayed that random image
* time.now for sales w/o dates
* you _can_ use `self.blerg` syntax to make class methods in the models???!
   * also !R SQL `like` keyword
   * `def self.search(query)`  
     ....`where("name LIKE ?", "%#{ query }%")`  
     `end`

discussed buttons vs links
* use buttons for submitting forms & javascript buttons
* use links for anything else
* !Q onclick javascript

Jeremy, I didn't have a chance to ask you about this, but I'm curious about what you were saying re: onclick not working as well as buttons for javascript triggers. ~~Is that because of mobile devices?~~ Can you tell me more about your stance?

the two best articles I read this week:
* http://www.npr.org/sections/codeswitch/2015/06/24/417108714/dispatch-from-charleston-the-cost-of-white-comfort
* http://www.thestranger.com/features/feature/2015/06/24/22436544/my-whole-life-ive-been-asked-if-im-a-girl-or-a-boy

HOMEWORK:
* ~~koans~~
* merge all outstanding code reviews
* take home assessment

1. Take home skill check

2. Review and close any/add open PRs that have been reviewed: Random Menu, FarMar (original), Hangman, Bank Accounts, Scrabble, Scrabble Sinatra

<div align="right">^<a href="#jump-links">top</a></div>
