- - -
> ### jump links ###
- - -

* [day 11](#day-eleven)
* [day 12](#day-twelve)
* [day 13](#day-thirteen)
* [day 14](#day-fourteen)
* [day 15](#day-fifteen)

- - -
> ### day eleven ###
- - -

reviewing what we'll be doing this week

guest speakers
* don't use computer for notes
* show the utmost respect

re: act-w conference
* might ask Moz CEO Sarah Bird to stop by and speak to us

finished the retrospective from friday

[enumerables][enum]
* [able to be counted by one-to-one correspondence with the set of all positive integers][googenum]
* .map == .collect (two names for same method)
* .find vs .find_all
   * vs .map or .sort_by & then .first(5) after block
* alice group by demo

conflict resolution / teamwork discussion
* guest speaker mikaela kiner
<!-- * [my notes][mycr] -->

classes vs modules ([my notes][mycnm])
* a class is a bucket of ruby code that is related
* a module is also a bucket of code
* super()
* .singleton_methods

[class methods][cm]
* [internet thing][classmethods]
* called directly by the class, not by the instance of the class [(ie, by Wizard, not parry_hotter)][hp]
* a class method does not know anything about instance variables, because only instances can see those.
   * `pawn = new("whatevs")`  
     `puts @position # <-- noo, class can't see instance`  
     `puts pawn.position` # "whatevs"

ruby heroes video
* sandy metz

[inheritance via fish][fish]

HOMEWORK
* learn ruby the hard way, chapters 40-42


[enum]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/enumerable.md

[googenum]: https://www.google.com/search?q=enumerable%20definition

[mycnm]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d011-methods-vs-classes.md

[cm]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/revisiting_classes.md

[classmethods]: http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/

[hp]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d011-harry-potter-module.rb

[fish]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d011-fish.rb

<div align="right">^<a href="#jump-links">top</a></div>



- - -
> ### day twelve ###
- - -

[advanced variables][av]
* in ruby town, no globals.
* [experimenting with scope of variables][varexp]

[csv as a database][csvdb]
* `require 'csv'`
* `CSV.open(filename, 'r', headers: true).each do |row|`  
  `..puts row`  
  `end`
* [experimenting with this][csvexp]

group projects, paired w/ shanna

what is pairing?
* it's not working separately
* it's not one person working and one person waiting to work
* pilot/navigator:
    * pilot: person at keyboard is playing with tools, using keyboard to express
      the thoughts
    * navigator: keeps pilot on track, uses brain to keep track of where at in
      thoughts. where are we going next?
    * be intentional in switching up the role!

helpful pairing tools:
* pomodoro / 25min work, 5 min break, swap positions, repeat

__git fetch__ asks what changes have been made, while __git pull__ automagically
applies them
* so fetching first is a good way to make sure that you're not overwriting
  something important!

HOMEWORK:
* install rspec if you haven't already

[av]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/advanced_variables.md

[csvdb]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/csv_database.md

[csvexp]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d012-csv-experimentation.rb

[varexp]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d016-factorial.rb

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day thirteen ###
- - -

reviewed some of the concepts from the farmar project
* use .insert method to add header row to csv


[test driven development][tdd]
* [rspec 101][rs101]
   * `rspec --init` has to be done for each project
   * like git init ;)

re: code reviews
* we'll have __two__ days from code reviews going live to continue the dialogue.
* then you will be graded against the rubric.
   * you CAN update your code based on the code review.
* if you don't understand a comment, ask for clarification!
* if you got some super useful advice, share it with the class!
* bring it up with teachers if you don't feel comfortable commenting on github.
* if you're not making changes, acknowledge that. like: thank you so much for
  your comments! I'm not going to make any changes at this time. :)


HOMEWORK:
* read about rspec best practices: http://betterspecs.org/
* come up with three examples of your own that demonstrate a "good" and "bad" scenario in the same method as the better specs.


[tdd]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/tdd_bdd.md

[rs101]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/rspec.md

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day fourteen ###
- - -

!Q !R
* `.select` array method
* `end.first` -- does mean kill loop after first result?

rspec
* `rspec spec --format nested` tells you more about your passing tests

git
* `git commit --amend -m "New commit message"`

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day fifteen ###
- - -

[ruby koans][koans] ([.com][koans.com])
* about learning red, green, refactor
* [assertions][kass]
* rake is a tool written in ruby to execute commands
   * we'll use it a lot in rails

skill check & review
* `.group_by`! <3

HOMEWORK:
* start working through the ruby koans
  * `about_true_and_false.rb` !Q why :true_stuff, :false_stuff?
     * !Q !T empty strings, arrays, & hashes are all true?
  * `about_objects.rb` nil is an Object! !Q nil Object?
     * !Q `.inspect`?
     * !Q integer object_ids! why? binary?
  * `about_methods.rb`
     * `test_calling_with_default_values` (lines 22-25) !Q 1, :default_value && 1, 2
  * `about_arrays.rb`
     * `test_slicing_arrays` (lines 42-44) !Q !T [4, 0] == [], [4, 100] == [], [5, 0] == nil
     * `test_slicing_with_ranges` (line 59) !Q !T [2..-1] != 2, 1, 0, -1???

  * `about_arrays_assignment.rb`
     * YESSSSSSSssss:  
       first_name = "Roy"  
       last_name = "Rob"  
       first_name, last_name = last_name, first_name  
       IT WORKS!!!!112six :D

  * `about_hashes.rb`
     * `test_default_value` (lines 87-91) !Q how it knows :two == "dos"??

 * !Q feedback on speed of FarMar methods:
    * `Vendor.most_items`
    * `Vendor.most_revenue`
    * `Product.most_revenue`

[koans]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/koans.md

[koans.com]: http://rubykoans.com/

[kass]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/assert.md

<div align="right">^<a href="#jump-links">top</a></div>
