import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

int computerBinarySearch() {
  print(
      "Come up with the number from 1 to 100 so that computer could guess it: ");

  int min = 1;
  int max = 101;
  int count = 0;

  while (min <= max) {
    int middle = (min + max) ~/ 2;
    count++;
    print("Is it $middle?\n1) Yes\n2) Greater\n3) Less");
    int answer = int.parse(stdin.readLineSync()!);

    if (answer == 1) {
      print("Got it in $count steps!");
      break;
    } else if (answer == 2) {
      min = middle;
    } else if (answer == 3) {
      max = middle;
    } else {
      print("No such option");
    }
  }
  return count;
}

int gameForUserToGuess() {
  int count = 0;
  int random = Random().nextInt(101);
  int userGuess = 0;
  print("Guess the number from 1 to 100: ");

  while (userGuess != random) {
    count++;
    print("Enter your guess: ");
    userGuess = int.parse(stdin.readLineSync()!);

    if (userGuess < random) {
      print("Greater");
    } else if (userGuess > random) {
      print("Less");
    }
  }
  print("Got it in $count steps!");
  return count;
}

void startGame() {
  print("Choose how many rounds you wanna play (from 1 to 10)");
  String roundsNumber = stdin.readLineSync()!;

  int totalRounds = 0;
  int currentRound = 1;
  int computerScore = 0;
  int userScore = 0;

  print("==========round $currentRound==========");

  if (roundsNumber.isNotEmpty) {
    totalRounds = int.parse(roundsNumber);
  } else {
    totalRounds = 3;
  }

  int computerSteps = computerBinarySearch();
  int userSteps = gameForUserToGuess();

  while (totalRounds > currentRound) {
    if (computerSteps < userSteps) {
      computerScore++;
    } else if (computerSteps > userSteps) {
      userScore++;
    } else {
      computerScore++;
      userScore++;
    }
    print("Computer-$computerScore : User-$userScore");

    currentRound++;
    print("==========round $currentRound==========");
    computerBinarySearch();
    print("==========your turn==========");
    gameForUserToGuess();
  }
  print("Computer-$computerScore : User-$userScore");

  if (computerScore > userScore) {
    print("Computer won, maybe next time");
  } else if (computerScore < userScore) {
    print("You won! Congrats!");
  } else {
    print("Nobody won, try again");
  }
}
