import 'package:badrunk/bloc/desafios.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Desafios desafio = new Desafios();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _appBody(),
    );
  }

  Widget _appBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _appText(),
          _appButton(),
        ],
      ),
    );
  }

  Widget _appText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        desafio.getDesafio(),
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _appButton() {
    return FlatButton(
      onPressed: (){
        setState(() {
          if(desafio.isFinished()) {
            Toast.show("As perguntas recomeçarão", 
            context, 
            duration: Toast.LENGTH_LONG, 
            gravity:  Toast.BOTTOM,
            backgroundColor: Colors.red,
            );
            desafio.resetar();
          } else {
            desafio.updateIndex();
          }
        });
      },
      child: Text(
        'Vamos lá!',
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }
}