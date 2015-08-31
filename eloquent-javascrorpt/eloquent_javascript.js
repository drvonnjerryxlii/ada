// note: start at the bottom if you want to see what I wrote first.


// return true if testCondition matches all array items
function every(array, testCondition) {
  result = true;
  for (var i = 0; i < array.length; i++) {
    if (!testCondition(array[i])) {
      result = false;
      break;
    };
  }
  return result;
}

// return true if testCondition matches any array item
function some(array, testCondition) {
  result = false;
  for (var i = 0; i < array.length; i++) {
    if (testCondition(array[i])) {
      result = true;
      break;
    };
  }
  return result;
}

// log(every([NaN, NaN, NaN], isNaN));
// // → true
// log(every([NaN, NaN, 4], isNaN));
// // → false
// log(some([NaN, 3, 4], isNaN));
// // → true
// log(some([2, 3, 4], isNaN));
// // → false


// Use the reduce method in combination with the concat method to “flatten” an array
// of arrays into a single array that has all the elements of the input arrays.
var arrays = [[1, 2, 3], [4, 5], [6]];
function flatten(array) { // NOTE: rewrite me to be resursive!
  flattened = [];
  array.forEach(function(innerArray) {
    // !W something can be done here to check if innerArray is array
    // if not, push to flatten, if so, forEach and continue
    if (Array.isArray(innerArray)) {
      innerArray.forEach(function(item) {
        flattened.push(item);
      });
    };
  });
  return flattened;
}

// log(flatten(arrays));
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

function deepEqual(first, second) {
}

// var obj = {here: {is: "an"}, object: 2};
// log(deepEqual(obj, obj));
// → true
// log(deepEqual(obj, {here: 1, object: 2}));
// // → false
// log(deepEqual(obj, {here: {is: "an"}, object: 2}));
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

function nth(list, index) {
  if (index == 0)
    return list.value;
  else if (list.rest == null)
    return undefined;
  else
    return nth(list.rest, index - 1);
}

function prepend(value, list) {
  return { value: value, rest: list };
}

function listToArray(list) {
  var array = [];
  while (list.value) {
    array.push(list.value);
    list = list.rest;
    if (list == null)
      break;
  }
  return array;
}

function arrayToList(array) {
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

// log(arrayToList([10, 20]));
// // → {value: 10, rest: {value: 20, rest: null}}
// log(listToArray(arrayToList([10, 20, 30])));
// // → [10, 20, 30]
// log(prepend(10, prepend(20, null)));
// // → {value: 10, rest: {value: 20, rest: null}}
// log(nth(arrayToList([10, 20, 30]), 1));
// // → 20
// log(nth(arrayToList([10, 20, 30]), 40));
// // → undefined


function reverse(array) {
  var reversed = [];
  for (var i = array.length - 1; i >= 0; i--)
    reversed.push(array[i]);

  return reversed;
}

// x = [1, 2, 3, 4, 5];
// log(reverse(x));
// // → ["C", "B", "A"];
// log(x);


function reverseArrayInPlace(array) {
  var last = array.length - 1;
  for (var first = 0; first < last; first++) {
    lastItem = array[last];
    array[last] = array[first];
    array[first] = lastItem;
    last--;
  }
}

// var arrayValue = [1, 2, 3, 4, 5];
// reverseArrayInPlace(arrayValue);
// log(arrayValue);
// // → [5, 4, 3, 2, 1]

function range(start, end) {
  if ((start % 1 == 0) && (end % 1 == 0)) { // the end number probably doesn't need to be an integer, but for consistency's sake...
    var output = [];
    for (var i = start; i <= end; i++)
      output.push(i);

    return output;
  }
}

function sum(numbersArray) {
  var total = 0;
  for (var i = 0; i < numbersArray.length; i++)
    total += isNaN(i) ? 0 : numbersArray[i]; // isNaN(i) is checking for non-numeric values

  return total;
}

// log(sum(range(1, 10)));

function getBiggest(numbersArray) {
  // pass an array to getBiggest
  // get a return value that is the biggest number in the array
  var biggestNumber = numbersArray[0];

  for (var i = 1; i < numbersArray.length; i++)
    biggestNumber = (numbersArray[i] > biggestNumber) ? numbersArray[i] : biggestNumber;

  return biggestNumber;
}

// var arrayOfNums = [2, 7, 7, 3, 9, 0, 1, 6, 8, 3, 8, 4, 7, 9];
// var biggest = getBiggest(arrayOfNums);
// log("The biggest is: ", biggest);

var ToDo = {
  task: "Finish the exercises before it stops being Sunday.",
  assignee: "Jarg Jeeooorrrrb",
  done: getBiggest([3, 17, 42, 6, 10]) == 42, // this task is finished if getBiggest is complete & works right
  getDone: function() { return this.done; },
  setDone: function(state) { this.done = state; }
}

// log(ToDo.done);

function countBs(string) {
  return countChar(string, "B");
}

// this function will only work if the user passes in a single character for char
function countChar(string, char) {
  char_count = 0;
  for (var i = 0; i < string.length; i++) {
    if (string.charAt(i) == char)
      char_count++;
  }
  return char_count;

}

// log(countBs("BBC"));
// // → 2
// log(countChar("kakkerlak", "k"));
// // → 4

function isEven(num) {
  if (Array.isArray(num)) { return every(num, isEven); }
  if (isNaN(num) || num % 1 !== 0 || num === 1) { return false; }
  if (num === 0) { return true; }
  if (num > 0) { return isEven(num - 2); }

  return isEven(-num);
}

log(isEven(50));
log(isEven(0));
log(isEven(-40));
log(isEven([2, 4, 6]));
// → true
log(isEven(75));
log(isEven(-1));
log(isEven("potato"));
log(isEven(0.5));
log(isEven([2, 4, 5, 6]));
log(isEven({}))
// → false

function min() {
  var smallest = arguments[0];
  for (var i = 1; i < arguments.length; i++) {
    current = Array.isArray(arguments[i]) ? min.apply(undefined, arguments[i]) : arguments[i];
    if (!isNaN(current)) // unless the current argument is a number
      smallest = current < smallest ? current : smallest;
  }
  return smallest;
}

// log(min(0, {}, 10, 40, "potato", 67, 200, 3000));
// // → 0
// log(min(0, {}, 10, 40, 64, [5, -200, 4], 200, 3000));
// // → -200
// log(min(0, 2, 6, 8, -10, -8));
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
    log(output);
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
    log(output);
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

  log(output);
}

// triangle(3);
// triangle(7);
// triangle(25);

function factorial(n) {
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

// log(factorial(3));
// log(fac(8));

// except for log, which is at the top here for everything else to use.
function log(objToLog) { // this is an alias for console.log b/c I want to type less
  console.log(objToLog)
}
