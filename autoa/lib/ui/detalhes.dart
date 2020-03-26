import 'package:autoa/helpers/constantes.dart';
import 'package:autoa/model/carro.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  final Carro carro;
  Detalhes(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(carro.tipo.toUpperCase()), backgroundColor: Colors.black),
      body: _bodyApp(),
    );
  }

  Widget _bodyApp() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Image.network(carro.urlFoto),
            ),
            _detalhesText(carro.nome, ESTILOMEDIO),
            _detalhesText(carro.descricao, ESTILOPEQUENO),
          ],
        ),
      ),
    );
  }

  Widget _detalhesText(carro, estilo) {
    return Text(
      carro,
      style: estilo,
      textAlign: TextAlign.center,
    );
  }
}
