import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cadastro',
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return SafeArea(
      child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _formField(labelTxt: 'Telefone'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _formField(labelTxt: 'Senha', obscure: true),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: _botao('Entrar', context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField({obscure = false, labelTxt}) {
    return TextFormField(
      obscureText: obscure,
      keyboardAppearance: Brightness.dark,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      decoration: InputDecoration(
        labelText: labelTxt,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }

  Widget _botao(txtBotao, context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.lightBlue[600],
        child: Text(
          txtBotao,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
    );
  }
}