if it starts with right or ends with a left, it fails

first step -- count how many left ([) and right (])
* if not equal, not balanced

if ever more right than left, then not pass

[[[][]][]]
1232321210 balanced!

[[[]][]][]]
1232121010-1 not balanced!

next, starting from the left
- need to check for if a left is followed by a left or a right
   * if it's followed by a right, delete the pair and continue checking from ltr
   * if it's followed by a left, check for a 
