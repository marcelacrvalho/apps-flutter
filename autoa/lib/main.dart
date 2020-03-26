import 'package:autoa/ui/inicial.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Autoa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.transparent,
        splashColor: Colors.yellow,
        buttonColor: Colors.lightBlue[600],
      ),
      home: Inicial(),
    );
  }
}
