- - -
> ### jump links ###
- - -

* [day one](#day-one)
* [day two](#day-two)
* [day three](#day-three)

<!--
* [day four](#day-four)
* [day five](#day-five) -->

- - -
> ### day one ###
- - -

the morning was mostly get-to-know you games. in the afternoon, we started
digging into some basics of the program, like the student handbook.

we went over these things:
* [student handbook][sh]
* [how to os x][osx]

[sh]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/Student%20Handbook.pdf
[osx]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/how-to-os-x.md

also discussed:
* [this awesome programming tree][tree]
   * by the end of this class, we should have two or three branches lit up, so
     to speak.
* [syntactic sugar][ss] & ruby not having a lot of it
   * syntax isn't the hard part. abstractions and how you solve it are the real
     process you're learning.
   * without too much syntactic sugar, you can then focus more on the
     abstractions and what's really going on under the hood.
* off topic
   * new homestarrunner video: fish eye lens.

[tree]: http://postimg.org/image/b3ob6w8oh
[ss]: http://en.wikipedia.org/wiki/Syntactic_sugar

assigned homework:
* read preface & chapter 1 of learn to program

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day two ###
- - -

the first half of the morning was a discussion about [prominent women][pw]
in programming and computer science.

[pw]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/empowered_women.md

then we went over:
* [intro to UNIX][unix]
   * ⌘k - clears buffer in terminal
   * open [filename] - opens filename w/ default program
      * open -a [prog name / path] [filename]
   * ⌃l - clears all (same as typing clear)
   * pwd - print working directory
   * ~ - home directory
   * .. - next one up
      * ../.. - two up!
   * . - current directory
   * ls -lh
   * ls -l
   * ls -lah
   * piping
      * ps
      * ps aux
      * ps aux | grep rubyls
      * history | grep irb
         * ⌃r
* [installfest][if]
   * installed ruby 2.2.1, not 2.1.2

watched this video:
   * [cascadia ruby, jason clark, teaching my 5-year-old ruby][crjc]

[unix]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/nix.md

[if]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/installfest.md

[crjc]: http://confreaks.tv/videos/cascadiaruby2014-programming-in-the-small-teaching-my-5-year-old-ruby

assigned homework:
* look up bash profile / setting aliases
   * prompt setup: customize ps1
* read chapter 2 - 4 of learn to program
   * [exercise 2.5][2.5]

[2.5]: https://github.com/drvonnjerryxlii/ada/blob/master/learn-to-program/ex2.5.rb

<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day three ###
- - -

we discussed:
* [ruby 101][r101]
   * _round_ is a method that exists on a _float_ object
   * played around in irb a lot
* [atom][atom]
   * sublime package manager / package control
   * setting up subl / atom open commands for terminal
   * ⌘⌃↑ and ⌘⌃↓ move active line / selection up/down
   * ⌃⇧M - open preview pane for markdown
   * LINTER magic - ⌘D
* [ruby 102][r102]
  * more playing around in irb
  * use double quotes (") if you need to use escape sequences (\n)
  * use single quotes (') if you need to use the string literal / _show_ the escape sequences
  * symbol object ids
     * you can use object ids to figure out whether two vars point at the same value / object
  * you can space out numbers w/ underscores!
     * 1000000 == 1_000_000
     * integers == fixed nums
     * decimals == float
   * ==.js - evaluates both sides & looks at resultant expressions / values
   * ===.js - also cares about parent object types
* [flow][flow]
   * must __end__ an __if__ statement _block_!

internships! we discussed these at length

today's project: study two methods for assigned data type, and create a little
demo to teach everyone about the two methods you select.
* [Sally][sally] & I wrote [this demo for integer methods .even? and .odd?][may6]

assigned homework:
* read chapter 5 of learn to program
   * [exercise 5.6][5.6]
* figure out why "a" > "A" (according to irb)

[r101]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/ruby-101.md

[atom]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/atom.md

[r102]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/ruby-102.md

[flow]: https://github.com/Ada-Developers-Academy/daily-curriculum/blob/master/topic_resources/flow-control.md

[5.6]: https://github.com/drvonnjerryxlii/ada/blob/master/learn-to-program/ex5.6.rb

[sally]: https://twitter.com/sallysuru

[may6]: https://github.com/drvonnjerryxlii/ada/blob/master/learn-to-program/d003-even-odd.rb

<div align="right">^<a href="#jump-links">top</a></div>

<!--
- - -
> ### day four ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>


- - -
> ### day five ###
- - -


<div align="right">^<a href="#jump-links">top</a></div>
-->
