var fs = require('fs');
var filePath = process.argv[2]; // it will be provided as the first argument in the command line
var buffer = fs.readFileSync(filePath);
var stringVersion = buffer.toString();
var arrayVersion = stringVersion.split("\n");
console.log(arrayVersion.length - 1); // we want the count, but the last line won't contain a newline char at the end
