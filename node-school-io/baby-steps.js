var processArray = process.argv;
var sum = 0;

for (var i = 2; i < processArray.length; i++) {
  currentItem = processArray[i];
  sum += Number(currentItem);
}

console.log(sum);
