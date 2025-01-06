import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wordle/Providers/wordle_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
  
    return Consumer<WordleModel>(
        builder: (context, value, child) => Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(screenSize.height * 0.1),
                child: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  flexibleSpace: Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: screenSize.width * 0.08, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenSize.width*0.1),
                      child: ElevatedButton(
                        onPressed: value.generateNewWord,
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: screenSize.width * 0.07),
                        ),
                      ),
                    ),
                    Center(child: generateColumnOfBoxes(value.currentWord, screenSize)),
                    Padding(
                      padding:  EdgeInsets.only(top: screenSize.height * 0.05),
                      child: Text(
                        value.currentWord,
                        style: TextStyle(fontSize: screenSize.width * 0.1),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

Widget generateColumnOfBoxes(String currentWord, Size screenSize) {
  int boxesPerRow = currentWord.length; // You can change this based on your needs
  double boxSize = (screenSize.width-40) / boxesPerRow; // Make the boxes fit

  return Column(
    children: List.generate(5, (index) {
      // Generate a list of the first elements from each row of boxes, 5 is the number of guesses allowed
      return generateBoxes(index, currentWord, screenSize, boxSize);
    }),
  );
}

Widget generateBoxes(int rowIndex, String currentWord, Size screenSize, double boxSize) {
  return Padding(
    padding: EdgeInsets.all(screenSize.width * 0.01),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(currentWord.length, (index) {
        //For each row, generates the needed amount of boxes according to the word length
        return SizedBox(width: boxSize, child: generateBox(boxSize));
      }),
    ),
  );
}

Widget generateBox( double boxSize) {
  
  return Card(
    elevation: 4,
    // color: theme.colorScheme.inversePrimary,
    margin: const EdgeInsets.all(2),
    child: TextField(
      style: TextStyle(
        fontSize: boxSize/2
      ),
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(1)
      ],
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
          border: InputBorder.none, contentPadding: EdgeInsets.all(10.0)),
    ),
  );
}




/*
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                value.count.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //First i get acces to the counter class
            final counter = context.read<WordleModel>();
            //Now acces the method
            counter.increment();
          }, 
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    */