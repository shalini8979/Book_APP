
import 'package:flutter/material.dart';
import 'package:untitled2/bookscreen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      
      theme: ThemeData( ),
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.purpleAccent,
          body: newScreen(),
        ),
    );
  }
}


