var fs = require('fs');
var dirToCheck = process.argv[2];
var extension = "." + process.argv[3];

fs.readdir(dirToCheck, findMatchingFiles);

function findMatchingFiles(err, list) {
  // error handling
  if (err) {
    console.log("some error happened!");
    console.log(err);
    return;
  }

  var path = require('path');

  list.forEach(function(filePath) {
    if (path.extname(filePath) == extension)
      console.log(filePath);
  });
}
