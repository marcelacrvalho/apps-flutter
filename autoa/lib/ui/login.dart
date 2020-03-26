import 'package:autoa/api/login.api.dart';
import 'package:autoa/api/response.api.dart';
import 'package:autoa/helpers/navigator.dart';
import 'package:autoa/ui/cadastro.dart';
import 'package:autoa/ui/principal.dart';
import 'package:flutter/material.dart';

TextEditingController _controllerSenha = TextEditingController();
TextEditingController _controllerLogin = TextEditingController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Login',
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
              child: _formField(_controllerLogin, labelTxt: 'Telefone'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _formField(_controllerSenha,
                  labelTxt: 'Senha', obscure: true),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: _botao('Entrar', context, Principal()),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: _botao(
                'Cadastrar',
                context,
                Cadastro(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField(controller, {obscure = false, labelTxt}) {
    return TextFormField(
      controller: controller,
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

  Widget _botao(txtBotao, context, proximaPagina) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      child: RaisedButton(
        onPressed: () => _onClickLogin(context, proximaPagina),
        color: Colors.lightBlue[600],
        child: Text(
          txtBotao,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
    );
  }

  void _dialogError(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text('Usuário ou senha incorretos'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context), 
                child: Text('Ok'),
                )
            ],
          ),
          );
      }
      );
  }

  void _onClickLogin(context, proximaPagina) async {
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    ApiResponse response = await LoginApi.login(login, senha);

    response.ok == true ? navigatorReplacement(context, proximaPagina) : _dialogError(context);
  }
}
