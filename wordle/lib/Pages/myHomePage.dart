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
    return Consumer<WordleModel>(
        builder: (context, value, child) => Scaffold(
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
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(48.0),
                      child: ElevatedButton(
                        onPressed: value.generateNewWord,
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Center(child: generateColumnOfBoxes(value.currentWord)),
                    Text(
                      value.currentWord,
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
              ),
            ));
  }
}

Widget generateColumnOfBoxes(String currentWord) {
  return Column(
    children: List.generate(5, (index) {
      // Generate a list of the first elements from each row of boxes, 5 is the number of guesses allowed
      return generateBoxes(index, currentWord);
    }),
  );
}

Widget generateBoxes(int rowIndex, String currentWord) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(currentWord.length, (index) {
        //For each row, generates the needed amount of boxes according to the word length
        return SizedBox(width: 50, child: generateBox());
      }),
    ),
  );
}

Widget generateBox() {
  //final theme = Theme.of(context);
  return Card(
    elevation: 4,
    // color: theme.colorScheme.inversePrimary,
    margin: const EdgeInsets.all(4.0),
    child: TextField(
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(1)
      ],
      decoration: InputDecoration(
          border: InputBorder.none, contentPadding: EdgeInsets.all(8.0)),
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