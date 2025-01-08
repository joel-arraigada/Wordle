import 'dart:io';

import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget{

  final int id;
  final String name;
  final String parkName;
  final String img;

  const Restaurant({
    super.key,
    required this.id,
    required this.name,
    required this.parkName,
    required this.img
    });
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height*0.4),
        child: 
        Column(
          children: [
            SizedBox(
              height: screenSize.height *0.3,
              child: Image.file(
                File(this.img),
                fit:BoxFit.scaleDown),
                width: double.infinity,),
            Text(this.name),
          ],
        ),
      ),
      body: Center(
      ),
    );
  }
}