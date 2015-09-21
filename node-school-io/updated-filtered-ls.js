// Create a program that prints a list of files in a given directory, filtered by the extension of the files. The first argument is the directory name and the second argument is the extension filter. Print the list of files (one file per line) to the console. You must use asynchronous I/O.

var filter = require("./module-filtered-ls");

function logFiles(err, data) {
  if (err) {
    console.log("error received: " + err);
    return;
  }

  data.forEach(function(item) {
    console.log(item);
  });
}

path = process.argv[2];
extension = process.argv[3];

filter(path, extension, logFiles);

// console.log();
