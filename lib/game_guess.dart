import 'dart:io';

import 'package:gamenumber/game.dart';

void main() {
  bool check = true;
  late GuessResult guessResult = GuessResult.correct;
  var Max;
  var game;

  while (true) {

    if(check == true){
      stdout.write('Enter a maximum number to random : ');
      var maximum = stdin.readLineSync();
      Max = int.tryParse(maximum!);

      game = Game(Max!);


      print('╔═══════════════════════════════════════════');
      print('║              GUESS THE NUMBER             ');
      print('╟───────────────────────────────────────────');
    }

    stdout.write('║ Guess the number between 1 and $Max : ');
    var input = stdin.readLineSync();

    if (input == null) {
      print('Error');
      return;
    }
    var Guess = int.tryParse(input);

    if (Guess == null) {
      continue;
    }


    guessResult = game.doGuess(Guess);

    if (guessResult == GuessResult.correct) {
      print(
          '║ ➜ $Guess is CORRECT ❤, total guesses : ${game.getTotalGuesses()}');
      print('╟───────────────────────────────────────────');
      print('║                   THE END                 ');
      print('╚═══════════════════════════════════════════');
      var playagain;
      while (true) {
        stdout.write('Play again? (Y/N) : ');
        playagain = stdin.readLineSync();
        if (playagain == "Y" ||
            playagain == "y" ||
            playagain == "N" ||
            playagain == "n") {
          break;
        } else {

          continue;
        }
      }

      if (playagain == 'N' || playagain == 'n') {
        print("You've played  ${game.getlenlist()} game");
        game.gettotallist();
        return;
      }
      check = true;
      continue;
    } else if (guessResult == GuessResult.tooHigh) {
      check = false;
      print('║ ➜ $Guess is TOO HIGH! ▲');
      print('╟───────────────────────────────────────────');
    } else if (guessResult == GuessResult.tooLow) {
      check = false;
      print('║ ➜ $Guess is TOO LOW! ▼');
      print('╟───────────────────────────────────────────');
    }
  }
}