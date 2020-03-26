import 'package:flutter/material.dart';
import 'package:xilophone/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xilophone',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Home(),
    );
  }
}
