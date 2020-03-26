import 'package:flutter/material.dart';
import 'package:quiz/cerebro.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Cerebro cerebro = Cerebro();
List<Icon> listaIcones = [];

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: _appTextQuestion(),
            ),
            _appButton(Colors.tealAccent[400], 'Verdadeiro', true),
            _appButton(Colors.red[400], 'Falso', false),
            Divider(),
            Row(
              children: listaIcones,
            ),
          ],
        ),
      ),
    );
  }

  Widget _appTextQuestion() {
    return Center(
      child: Text(
        cerebro.getPergunta(),
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _appButton(cor, nome, respostaUsuario) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.7,
      child: RaisedButton(
        color: cor,
        onPressed: () {
          setState(() {
            if (cerebro.isFinished()) {
              Alert(
                context: context,
                type: AlertType.error,
                title: "UHUUL",
                desc: "As perguntas acabaram. Parabéns!",
                buttons: [
                  DialogButton(
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      cerebro.reset();
                      listaIcones.removeRange(0, cerebro.perguntasLenght());
                      Navigator.pop(context);
                    },
                    width: 120,
                  ),
                ],
              ).show();
            }
            bool respostaCorreta = cerebro.getResposta();
            if (respostaUsuario == respostaCorreta) {
              listaIcones.add(Icon(Icons.done, color: Colors.tealAccent[400]));
            } else {
              listaIcones.add(Icon(Icons.close, color: Colors.red[400]));
            }
            cerebro.proximaPergunta();
          });
        },
        child: Text(
          nome,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
