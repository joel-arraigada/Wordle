import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/Providers/wordle_model.dart';
import 'package:wordle/Pages/myHomePage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WordleModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Wordle 2 demo'),
    );
  }
}// import 'dart:math';

// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wordle Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x002c7aaF)),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Wordle Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int guesses = 5;
//   late String currentWord;
//   late List<List<TextEditingController>> textControllers;

//   @override
//   void initState() {
//     super.initState();
//     currentWord = getRandomWord(); //Initialize with a random word
//     textControllers = List.generate(
//         guesses,
//         (index) => List.generate(
//             currentWord.length, (index) => TextEditingController()));
//   }

//   String getRandomWord() {
//     return WordPair.random().asUpperCase; //Get a random word
//   }

//   void generateNewWord() {
//     setState(() {
//       currentWord = getRandomWord(); //Update the current word;
//       textControllers = List.generate(
//           guesses,
//           (index) => List.generate(
//               currentWord.length, (index) => TextEditingController()));
//     });
//   }

//   Widget generateColumnOfBoxes() {
//     return Column(
//       children: List.generate(guesses, (index) {
//         print("column");
//         return generateBoxes(index);
//       }),
//     );
//   }

//   Widget generateBoxes(int rowIndex) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(currentWord.length, (index) {
//           return Container(width: 50, child: generateBox(rowIndex, index));
//         }),
//       ),
//     );
//   }

//   Widget generateBox(int rowIndex, int columnIndex) {
//     final theme = Theme.of(context);
//     return Card(
//       elevation: 4,
//       color: theme.colorScheme.inversePrimary,
//       margin: const EdgeInsets.all(4.0),
//       child: TextField(
//         controller: textControllers[rowIndex][columnIndex],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           flexibleSpace: Center(
//             child: Text(
//               widget.title,
//               style: TextStyle(fontSize: 30, color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(48.0),
//               child: ElevatedButton(
//                 onPressed: generateNewWord,
//                 child: Text(
//                   'Next',
//                   style: TextStyle(fontSize: 30),
//                 ),
//               ),
//             ),
//             Center(child: generateColumnOfBoxes()),
//             Text(
//               currentWord,
//               style: TextStyle(fontSize: 40),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
