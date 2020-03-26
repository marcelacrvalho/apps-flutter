import 'dart:ui';
import 'package:autoa/helpers/constantes.dart';
import 'package:autoa/helpers/navigator.dart';
import 'package:autoa/ui/login.dart';
import 'package:flutter/material.dart';

class Inicial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _appBody(context),
    );
  }

  Widget _appBody(context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _titulo(),
                _texto(),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.yellow,
                  child: _botao(context),
                ),
              ],
            ),
          ),
          Expanded(flex: 3, child: imagem()),
        ],
      ),
    );
  }

  Widget _titulo() {
    return Text(
      'AUTOA',
      style: ESTILOGRANDE,
    );
  }

  Widget _texto() {
    return Text(
      'Os melhores carros. As melhores ofertas.',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    );
  }

  Widget _botao(context) {
    return FlatButton(
      onPressed: () => _navigator(context),
      child: Text(
        'Vamos lá',
        style: TextStyle(color: Colors.black, fontSize: 25.0),
      ),
    );
  }

  Widget imagem() {
    return Image.asset('imagens/fundo1.png', fit: BoxFit.cover);
  }

  void _navigator(context) {
    navigator(context, Login());
  }
}
