// note: start at the bottom if you want to see what I wrote first.

var every = function(array, testConditions) {
  // return true if testConditions match all item
}

var some = function(array, testConditions) {
  // return true if testConditions match any item
}


// Use the reduce method in combination with the concat method to “flatten” an array
// of arrays into a single array that has all the elements of the input arrays.
var arrays = [[1, 2, 3], [4, 5], [6]];
var flatten = function(array) {
  flattened = [];
  array.forEach(function(innerArray) {
    // !W something can be done here to check if innerArray is array
    // if not, push to flatten, if so, forEach and continue
    innerArray.forEach(function(item) {
      flattened.push(item);
    });
  });
  return flattened;
}

// console.log(flatten(arrays));
// → [1, 2, 3, 4, 5, 6]

// The == operator compares objects by identity. But sometimes, you would prefer to
// compare the values of their actual properties.
//
// Write a function, deepEqual, that takes two values and returns true only if they
// are the same value or are objects with the same properties whose values are also
// equal when compared with a recursive call to deepEqual.
//
// To find out whether to compare two things by identity (use the === operator for
// that) or by looking at their properties, you can use the typeof operator. If it
// produces "object" for both values, you should do a deep comparison. But you have
// to take one silly exception into account: by a historical accident, typeof null
// also produces "object".

// var deepEqual = function(first, second) {
//   // write some code here
//   // NOTE: !W come back to this after !R or !T a for each to find the keys
// }
//
// var obj = {here: {is: "an"}, object: 2};
// console.log(deepEqual(obj, obj));
// // → true
// console.log(deepEqual(obj, {here: 1, object: 2}));
// // → false
// console.log(deepEqual(obj, {here: {is: "an"}, object: 2}));
// // → true

// Write a function arrayToList that builds up a data structure like the previous
// one when given [1, 2, 3] as argument, and write a listToArray function that
// produces an array from a list. Also write the helper functions prepend, which
// takes an element and a list and creates a new list that adds the element to the
// front of the input list, and nth, which takes a list and a number and returns
// the element at the given position in the list, or undefined when there is no
// such element.
//
// If you haven’t already, also write a recursive version of nth.

var nth = function(list, index) {
  if (index == 0)
    return list.value;
  else if (list.rest == null)
    return undefined;
  else
    return nth(list.rest, index - 1);
}

var prepend = function(value, list) {
  return { value: value, rest: list };
}

var listToArray = function(list) {
  var array = [];
  while (list.value) {
    array.push(list.value);
    list = list.rest;
    if (list == null)
      break;
  }
  return array;
}

var arrayToList = function(array) {
  var rest;
  var lastIndex = array.length - 1;
  for (var i = lastIndex; i >= 0; i--) {
    if (i == lastIndex)
      rest = { value: array[i], rest: null };
    else
      rest = { value: array[i], rest: rest };
  }
  return rest;
}

// console.log(arrayToList([10, 20]));
// // → {value: 10, rest: {value: 20, rest: null}}
// console.log(listToArray(arrayToList([10, 20, 30])));
// // → [10, 20, 30]
// console.log(prepend(10, prepend(20, null)));
// // → {value: 10, rest: {value: 20, rest: null}}
// console.log(nth(arrayToList([10, 20, 30]), 1));
// // → 20
// console.log(nth(arrayToList([10, 20, 30]), 40));
// // → undefined


var reverse = function(array) {
  var reversed = [];
  for (var i = array.length - 1; i >= 0; i--)
    reversed.push(array[i]);

  return reversed;
}

x = [1, 2, 3, 4, 5];
console.log(reverse(x));
// → ["C", "B", "A"];
console.log(x);


var reverseArrayInPlace = function(array) {
  var last = array.length - 1;
  for (var first = 0; first < last; first++) {
    lastItem = array[last];
    array[last] = array[first];
    array[first] = lastItem;
    last--;
  }
}

var arrayValue = [1, 2, 3, 4, 5];
reverseArrayInPlace(arrayValue);
console.log(arrayValue);
// → [5, 4, 3, 2, 1]

var range = function(start, end) {
  if ((start % 1 == 0) && (end % 1 == 0)) { // the end number probably doesn't need to be an integer, but for consistency's sake...
    var output = [];
    for (var i = start; i <= end; i++)
      output.push(i);

    return output;
  }
}

var sum = function(numbersArray) {
  var total = 0;
  for (var i = 0; i < numbersArray.length; i++)
    total += isNaN(i) ? 0 : numbersArray[i]; // isNaN(i) is checking for non-numeric values

  return total;
}

// console.log(sum(range(1, 10)));

var getBiggest = function(numbersArray) {
  // pass an array to getBiggest
  // get a return value that is the biggest number in the array
  var biggestNumber = numbersArray[0];

  for (var i = 1; i < numbersArray.length; i++)
    biggestNumber = (numbersArray[i] > biggestNumber) ? numbersArray[i] : biggestNumber;

  return biggestNumber;
}

// var arrayOfNums = [2, 7, 7, 3, 9, 0, 1, 6, 8, 3, 8, 4, 7, 9];
// var biggest = getBiggest(arrayOfNums);
// console.log("The biggest is: ", biggest);

var ToDo = {
  task: "Finish the exercises before it stops being Sunday.",
  assignee: "Jarg Jeeooorrrrb",
  done: getBiggest([3, 17, 42, 6, 10]) == 42, // this task is finished if getBiggest is complete & works right
  getDone: function() { return this.done; },
  setDone: function(state) { this.done = state; }
}

// console.log(ToDo.done);

var countBs = function(string) {
  return countChar(string, "B");
}

// this function will only work if the user passes in a single character for char
var countChar = function(string, char) {
  char_count = 0;
  for (var i = 0; i < string.length; i++) {
    if (string.charAt(i) == char)
      char_count++;
  }
  return char_count;

}

// console.log(countBs("BBC"));
// // → 2
// console.log(countChar("kakkerlak", "k"));
// // → 4

function isEven(num) {
  if ((num == 2) || (num == 0))
    return true;
  else if (num <= 1)
    return false;
  else
    return isEven(num - 2);
}

//
// console.log(isEven(50));
// console.log(isEven(0));
// // → true
// console.log(isEven(75));
// console.log(isEven(-1));
// // → false

function min(first, second) {
  if (first <= second)
    return first;
  else
    return second;
}

// console.log(min(0, 10));
// // → 0
// console.log(min(0, -10));
// // → -10

function chessboard(board_size) {
  // these should be the same length
  var dark = "#|";
  var light = "O|";

  for (var row = 1; row <= board_size; row++) {
    // setup for drawing the board
    var first; var second;
    if (row % 2 == 0) { var first = dark; var second = light; }
    else { var first = light; var second = dark; };

    // now to draw it
    var output = "";
    for (var column = 1; column <= board_size; column++) {
      if (column % 2 == 0) { output += first; }
      else { output += second; };
    }
    console.log(output);
  }
}

// chessboard(8);

function fizzbuzz(stop_here) {
  var three = "Fizz";
  var five = "Buzz";
  for (var i = 1; i <= stop_here; i++) {
    var output = "";
    if (i % 3 == 0) { output += three; };
    if (i % 5 == 0) { output += five; };
    if ((i % 3 != 0) && (i % 5 != 0)) { output = i; };
    console.log(output);
  }
}

// fizzbuzz(15);

function triangle(peak_size) {
  var output = "";
  var triangle_char = ". ";

  // this line makes it possible to use any number of characters as a drawing unit
  var triangle_char_size = triangle_char.length;

  for (var i = 1; i <= peak_size; i++) {
    var row = triangle_char;
    while (row.length < (i * triangle_char_size))
      row += triangle_char;

    output += row + "\n";
  }

  for (var i = (peak_size - 1); i > 0; i--) {
    var row = triangle_char;
    while (row.length < (i * triangle_char_size))
      row += triangle_char;

    output += row + "\n";
  }

  console.log(output);
}

// triangle(3);
// triangle(7);
// triangle(25);

var factorial = function(n) {
  if (n == 0)
    return 1;
  else
    return fac(n - 1) * n;
};

function fac(n) {
  if (n==0)
    return 1;
  else
    return fac(n - 1) * n;
}

// console.log(factorial(3));
// console.log(fac(8));
