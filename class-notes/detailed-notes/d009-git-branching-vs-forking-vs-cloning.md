- - -
> ### git: branching vs forking vs cloning ###
- - -


#### cloning ####
(making a local working copy)

* when you clone something, you get all the branches, too.
* fetch repository to stay in touch / up-to-date.

#### branching ####
(making a safe place to work without screwing up production code)

* work in a branch on code that is not ready for production
   * when code is ready & only when code is ready: merge with master
    (production!)
   * master = breakfast
      * make branch for lunch
      * merge branch with your master/breakfast when lunch is ready & working
        well!

#### forking ####
(making a separate, self-contained copy of the project in your github to work on
separately)

* solar system
  * first commit added requirements
  * second added rubric
    * everyone will make their own branch
    * then everyone can fork project to their own separate work environment
      * and we will be cloning from here!

#### __pull requests__ ####
(merge a fork back into its source)


here is how it will look for us:
1. made a branch.  
2. forked repo to your github.
3. cloned to your machine.
4. worked on your code!
5. pushed code back to your github. <-- repeat steps 4 & 5 until ready for 6
6. open a pull request (PR). <-- this says your code is ready to be evaluated
