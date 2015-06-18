- - -
> ### jump links ###
- - -

btw, beware broken links. :)

* [day 16](#day-sixteen)
* [day 17](#day-seventeen)
* [day 18](#day-eighteen)
* [day 19](#day-nineteen)

- - -
> ### day sixteen ###
- - -

reviewed our goals for this week:
* less learning a ton of new stuff
* more learning when to do it this way instead of that way
* cultural idioms & style guides for programming in ruby

[algorithms][algo]
* recursion if it calls itself
* `return "Error message text" if num < 0`
* group exercise [factorials][fact]

live coded [fibonacci][fibo] (currently broken link b/c using for work on euler
problem #104 && euler problems == please don't publish)

live coded [roman numerals][roma] (redo of old assignment from learn to program)
* `rspec -fd` <-- includes documentation notes, ie, full context from tests for both passes & fails.

[scrabble][scrab]

HOMEWORK
* read preface & chapter 1 in practical object-oriented design in ruby (poodr)

[algo]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/recursion.md

[fact]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d016-factorial.rb

[fibo]: asfasdf

[roma]: https://github.com/drvonnjerryxlii/ada/blob/master/class-notes/detailed-notes/d016-convert.rb

[scrab]: https://github.com/Ada-Developers-Academy/C3Projects--Scrabble

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day seventeen ###
- - -

reviewed koans in more depth & continued working on them for ~30min.
* slicing uses space between arrays for references, not indexes of elements.
* flexible quoting!
   * `%(flexible quotes can handle both ' and " characters)`  
     `%!flexible quotes can handle both ' and " characters!`  
     `%{flexible quotes can handle both ' and " characters}`
* > Ruby programmers tend to favor the shovel operator (<<) over the
  > plus equals operator (+=) when building up strings.  Why?

[algorithm complexity][complex]
* [big o cheat sheet][bigocs]

continued working on scrabble project.

[complex]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/complexity.md
[bigocs]: http://bigocheatsheet.com/

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day eighteen ###
- - -

reviewed koans: about hashes
* Hash.new(something_here) sets a default value for keys
* if something_here == [], then the default value is AN array
* if you push into a default value that hasn't already been set (no hash[:key]
  = value), you might just be updating the default value.
     * `hash = Hash.new([])`
     * `hash[:one] = []` <-- sets a new value for new key `:one`
     * `hash[:one] << "uno"` <-- pushes into key `:one`'s current value
     * `hash[:two] << "dos"` <-- pushes into __the__ default array, since
       `hash[:two]` isn't separately defined & thus uses default value.
     * `hash[:three] << "tres"` <-- pushes into __the__ default array, since
       `hash[:three]` isn't separately defined & thus uses default value.
     * `hash[:one]` => `["uno"]` <-- returns unique value of `hash[:one]`
     * `hash[:two]` => `["dos", "tres"]` <-- returns default array
     * `hash[:three]` => `["dos", "tres"]` <-- returns default array
     * `hash[:four]` => `["dos", "tres"]` <-- returns default array

[jeremy & kari live-coded scrabble breakfast][jkscr]
* `a.to_sym == :a`!
* `binding.pry` in specs! <3
* finally covered ternary operators!!1two
   * (if_condition ? do_this_if_true : do_this_if_false)


[jkscr]: kgjhgfj

<div align="right">^<a href="#jump-links">top</a></div>


<!--
- - -
> ### day nineteen ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>

-->
