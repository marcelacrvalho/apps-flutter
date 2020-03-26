import 'package:flutter/material.dart';
import 'package:imc/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF1D1B30),
        primaryColor: Color(0XFF0D101F),
        accentColor: Colors.purple,
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        buttonColor: Colors.pink,
      ),
      home: Home(),
    );
  }
}
