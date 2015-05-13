* __awesome print__ displays data with helpful data colorizing
   * eg, integers purple (by default), strings yellowish
   * all of the colors can be customized
   * option to alphabetize keys!
      * `ap data2, option = {sort_keys: true}`

* __geocoder__ takes lat long & gives you
   * in CLI: google maps link, full address, city, state, etc. _this is so cool!_
      * `geocode -s geocoder_ca "47.679217, -122.386031"`
   * in irb
      * `require "Geocoder"`
        `Geocoder.search('Moz Seattle').first`
        `Geocoder.search('1100 2nd Ave, Seattle, WA')`
   * using geocoder w/ awesome print?

* __pry__ gives another way to interact w/ ruby files!
   * `pry -r ./baby_dragon`
     the interpreter output line => gets spit out on multiple lines w/ colorized data
     instead of all in one confused hash.
   * also colorizes data as you type!
   * can use cd to get into files
      * `pry`
        `cd BabyDragon`
        `ls -M` _lists methods!_
        `edit feed` _changes are saved!_
      * `cd`
        `edit BabyDragon#feed`

* __chronic__ is a natural processor for dates (in irb)
   * Chronic.parse("last year")
   * Chronic.parse("100 days ago")
   * Chronic.parse("1000 days ago").thursday?
   * Time.new(1990, 12, 31, 10, 31) vs Chronic.parse("12/31/90 10:31 am")
   * Chronic.parse("a year ago today")

 * __colorize__
