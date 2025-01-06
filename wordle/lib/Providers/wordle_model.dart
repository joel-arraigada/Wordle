import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordleModel extends ChangeNotifier {
  late String currentWord = getRandomWord();
  late List<List<String>> _wordInputs = List.generate(
      5,
      (index) => List.filled(currentWord.length,
          '')); //Creates a list of lists that will contain the 5 guesses
  String getRandomWord() {
    return WordPair.random().asUpperCase; //Get a random word
  }

  void generateNewWord() {
    currentWord = getRandomWord(); //Update the current word;
    _wordInputs = List.generate(
        5,
        (index) =>
            List.filled(currentWord.length, '')); //Update the List of guesses
    notifyListeners();
  }
}