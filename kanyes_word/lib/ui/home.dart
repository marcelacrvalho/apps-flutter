import 'package:flutter/material.dart';
import 'package:kanyes_word/services/quotes.dart';

String _currentQuote = 'double tap for kanye\'s word';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: _background(),
            ),
            Expanded(
              flex: 21,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  GestureDetector(
                    onDoubleTap: () {
                      _getQuotesApi();
                    },
                    child: _cardQuotes(_quotes()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'imagens/K.png',
            ),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _cardQuotes(textQuotes) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          ),
        ],
      ),
      child: textQuotes,
    );
  }

  _getQuotesApi() async {
    var currentQuote = await QuotesAPI.getQuotes();
    String quoteText = currentQuote['quote'].toString();
    setState(() {
      _currentQuote = quoteText;
    });
  }

  Widget _quotes() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        _currentQuote.toLowerCase(),
        style: TextStyle(color: Colors.white, fontSize: 22.0),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
}
