import 'package:flutter/material.dart';
import 'package:new_app/pages/restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,
      ),
      home: const Restaurant(
        id: 0001,
        name: "Sunshine Tree Terrace",
        parkName: "Magic Kingdom Park",
        img: "/Users/joel.arraigada/development/Flutter/Shared Repository/new_app/lib/images/sunshine-tree-terrace-01-new.jpg"
      )
    );
    
  }
}
