import 'package:flutter/material.dart';
import 'package:quiz/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}
