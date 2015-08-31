$(document).ready(function(){

  //------------ Initial Setup -------------------------------------------------
  // declaring global variables required for gameplay (see initializeGame() for details)
  var board, ships, shipNum, boardSize, gameOver, hits, guesses;

  // display units for board
  var EMPTY = "~ ";
  var SHIP = "S ";
  var HIT = "x ";

  //------------ Click Handlers ------------
  $("form :submit").click(function(event) { // submit guess button
    event.preventDefault();
    userGuess();
  });

  $("#again").click(function(event) { // play again button
    event.preventDefault();
    initializeGame();
  });

  initializeGame();

  function initializeGame(){
    board = []; // Stores the board info-- 0 for empty, 1 for ship, X when hit
    ships = []; // Stores the locations of the ships
    shipNum = 2; // Current number of ships
    boardSize = 10; // Size of the board
    gameOver = false; // Bool indicating whether or not game is over
    hits = 0; // Number of ship hits
    guesses = 0; // Number of guesses

    var userGuessForm = $("form");
    userGuessForm.show();

    var playAgain = $("#again");
    playAgain.hide();

    generateRandomBoard();
    printBoard();
  }

  function generateRandomBoard(){
    // Add some random ships
    var shipsAdded = 0;
    while (shipsAdded < shipNum) {
      var randomVal = Math.floor(Math.random() * (boardSize - 1));
      if (ships.indexOf(randomVal) < 0) { // Not already one of the ships
        ships.push(randomVal);
        shipsAdded++;
      }
    }

    // Set the board values based on ships added
    for(var j = 0; j < boardSize; j++) {
      if (ships.indexOf(j) < 0) { // This location not a ship
        board[j] = EMPTY; // Empty
      } else {
        board[j] = SHIP; // Ship!
      }
    }
  }

  function printBoard() {
    var boardOut = "";
    for(var i = 0; i < boardSize; i++)
      boardOut += board[i];

    $("#board").text(boardOut);
  }

  //------------ Gameplay ------------------------------------------------------

  function userGuess(){
    var guess = $("#guess").val(); // Retrieve the guess from the input box
    $("#guess").val(""); // Reset the guess input box

    // Verify the guess is in a valid range
    if (guess == undefined || isNaN(guess) || guess == "" || guess < 0 || guess > 9) {
      alert("That is not a valid guess! Please choose a number from 0 to 9.");
      return;
    } else { // guess is valid, so
      guesses++; // increment the guess counter
      $("#count").text(guesses); // tell the user how many guesses they've made
    };


    // Check if the guess matches one of our ship locations
    var result = $("#guess-result");
    if (board[guess] == SHIP) { // If it does, mark is as a HIT
      hits++; // increment hits
      result.text("HIT"); // give the player feedback
      board[guess] = HIT; // update the board
      printBoard(); // Redraw the board since it has changed
    } else { // If it doesn't, mark it as a MISS
      result.text("MISS");
    };

    if (hits == shipNum || guesses == 10)
      endGame();
  }

  function endGame() {
    var endGame = $("#end-game");
    var newText;

    newText = (hits == shipNum) ?
      "ALL SHIPS DESTROYED< HAHAHAHAHAHAHAHA" :
      "AT LEAST ONE SHIP ESCAPED. YOUR KINGDOM IS DOOMED.";
    endGame.text(newText);

    // ADDED FUN: Disable submit button
    var userGuessForm = $("form");
    userGuessForm.hide();

    // this lets the user play another game without having to reload the page :)
    var playAgain = $("#again");
    playAgain.show();
  }
});
