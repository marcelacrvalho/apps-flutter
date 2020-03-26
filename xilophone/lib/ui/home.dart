import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _appBody(),
    );
  }

  Widget _appBody() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _appPlayButton(1, Colors.red),
          _appPlayButton(2, Colors.orange),
          _appPlayButton(3, Colors.yellow),
          _appPlayButton(4, Colors.lightGreen),
          _appPlayButton(5, Colors.green),
          _appPlayButton(6, Colors.cyan),
          _appPlayButton(7, Colors.purple),
        ],
      ),
    );
  }

  Widget _appPlayButton(numero, cor) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioCache();
          player.play('note$numero.wav');
        },
        child: Container(
          height: 50.0,
          color: cor,
        ),
      ),
    );
  }
}
