import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordle Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x002c7aaF)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Wordle Demo'),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random().asUpperCase;

  // void getAnotherWord() {
  //   current = WordPair.random().asUpperCase;
  //   notifyListeners();
  // }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int guesses = 5;
  late String currentWord;

  @override
  void initState() {
    super.initState();
    currentWord = getRandomWord(); //Initialize with a random word
  }

  String getRandomWord() {
    return WordPair.random().asUpperCase; //Get a random word
  }

  void generateNewWord() {
    setState(() {
      currentWord = getRandomWord(); //Update the current word;
    });
  }

  Widget generateColumOfBoxes(int amount) {
    return Column(
      children: List.generate(guesses, (index) {
        return generateBoxes(amount);
      }),
    );
  }

  Widget generateBoxes(int amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amount, (index) {
          return generateBox();
        }),
      ),
    );
  }

  Widget generateBox() {
    final theme = Theme.of(context);
    return Card(
      elevation: 4,
      color: theme.colorScheme.inversePrimary,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          flexibleSpace: Center(
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: ElevatedButton(
              onPressed: generateNewWord,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Center(child: generateColumOfBoxes(currentWord.length)),
          Text(
            currentWord,
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}
