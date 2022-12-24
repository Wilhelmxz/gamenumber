import 'dart:math';

enum GuessResult {
  correct, tooHigh , tooLow
}

class Game {
  final int answer ;
  int _totalGuess = 0;
  static List<int> myList = [];

  Game(int maxRandom) : answer = Random().nextInt(maxRandom) + 1{
    myList.add(answer);
  }


  GuessResult doGuess(int guess) {
    ++_totalGuess;

    if (guess == answer) {
      return GuessResult.correct;
    } else if (guess < answer) {
      return GuessResult.tooLow;
    } else{
      return GuessResult.tooHigh;
    }

  }
// getter
  int getTotalGuesses() {
    return _totalGuess;
  }

  getlenlist(){
    var len = myList.length;
    return len;
  }

  gettotallist(){
    for (var i = 0; i < myList.length; i++) {
      print('🚀 Game #${i+1}: ${myList[i]} guesses');
    }

  }

}