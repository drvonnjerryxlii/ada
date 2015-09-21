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
  var matchingFiles = [];
  var lastItem = list.length - 1;

  list.forEach(function(filePath, index) {
    if (path.extname(filePath) == extension)
      matchingFiles.push(filePath);

    if (index == lastItem)
      return logMatchingFiles(matchingFiles);
  });
}

function logMatchingFiles(filesList) {
  filesList.forEach(function(filePath) {
    console.log(filePath);
  });
}
