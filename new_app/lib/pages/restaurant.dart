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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height*0.3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sunshine-tree-terrace-01-new.jpg'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.name)
              ),
              
            ],
          ),
        ),
      ),
    );
  }




  //   @override
  // Widget build(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //            SizedBox(
  //             height: screenSize.height *0.3,
  //              child: Image.file(
  //                File(this.img),
  //               fit:BoxFit.fitWidth),
  //               width: double.infinity,),
  //          Text(this.name),
  //          ],
  //        )
  //       )
  //     ),
  //   );
  // }
  
  // @override
  // Widget build(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;

  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size.fromHeight(screenSize.height*0.4),
  //       child: 
  //       Column(
  //         children: [
  //           SizedBox(
  //             height: screenSize.height *0.3,
  //             child: Image.file(
  //               File(this.img),
  //               fit:BoxFit.scaleDown),
  //               width: double.infinity,),
  //           Text(this.name),
  //         ],
  //       ),
  //     ),
  //     body: Center(
  //     ),
  //   );
  // }



}