import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart' as words;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Text(
          'English Random Words',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _meuBody(),
    );
  }

  Widget _meuBody() {
    return ListView.builder(
        itemCount: words.all.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: InkWell(
              onTap: () {},
              child: ListTile(
                subtitle: Text('Click here to see more about this word'),
                title: Text(
                  words.nouns[index].toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
          );
        });
  }
}
