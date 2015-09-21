function findMatchingFiles(directory, fileExtension, callback) {
  function standardizeFileExtension(extension) {
    return (extension[0] !== ".") ? "." + extension : extension;
  }

  function findMatchingFilesThenCallback(err, list) {
    if (err) {
      callback(err);
      return;
    }

    var path = require("path");
    var matchingFiles = [];
    var lastIndex = list.length - 1;
    list.forEach(function(filePath, index) {
      if (path.extname(filePath) == fileExtension)
        matchingFiles.push(filePath);
      if (index === lastIndex)
        callback(null, matchingFiles);
    });
  }

  var fs = require("fs");
  fileExtension = standardizeFileExtension(fileExtension);
  fs.readdir(directory, findMatchingFilesThenCallback);
}

module.exports = findMatchingFiles;
