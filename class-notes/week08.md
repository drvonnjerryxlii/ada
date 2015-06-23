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

#### [advanced routing][r102]

::> `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index

::> `config/routes.rb`: `resources :labels`  
::> `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
labels GET | /labels(.:format) | labels#index
POST | /labels(.:format) | labels#create
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

::> `config/routes.rb`: `resources :labels, except: [:create]`
::> `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
labels GET | /labels(.:format) | labels#index
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

::> `config/routes.rb`: `resources :labels do`  
::> `config/routes.rb`: ....`resources :albums`  
::> `config/routes.rb`: `end`  
::> `terminal`: `rake routes`

Prefix Verb | URI Pattern | Controller#Action
-----------:|-------------|------------------
root GET | / | welcome#index
label_albums GET | /labels/:label_id/albums(.:format) | albums#index
POST | /labels/:label_id/albums(.:format) | albums#create
new_label_album GET | /labels/:label_id/albums/new(.:format) | albums#new
edit_label_album GET | /labels/:label_id/albums/:id/edit(.:format) | albums#edit
label_album GET | /labels/:label_id/albums/:id(.:format) | albums#show
PATCH | /labels/:label_id/albums/:id(.:format) | albums#update
PUT | /labels/:label_id/albums/:id(.:format) | albums#update
DELETE | /labels/:label_id/albums/:id(.:format) | albums#destroy
labels GET | /labels(.:format) | labels#index
new_label GET | /labels/new(.:format) | labels#new
edit_label GET | /labels/:id/edit(.:format) | labels#edit
label GET | /labels/:id(.:format) | labels#show
PATCH | /labels/:id(.:format) | labels#update
PUT | /labels/:id(.:format) | labels#update
DELETE | /labels/:id(.:format) | labels#destroy

#### [far mar 2.0][twofar]

[agile]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/agile.md
[r102]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rails/routes-102.md


[twofar]: https://github.com/Ada-Developers-Academy/C3Projects--FarMarRails

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-six ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-seven ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirty-eight ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>
