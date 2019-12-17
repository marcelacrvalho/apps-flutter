import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(color: Colors.grey, fontSize: 20.0);
  Divider div = Divider(color: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_circle, color: Colors.pinkAccent, size: 200.0),
                _field(false, 'e-mail'),
                div,
                _field(true, 'senha'),
                div,
                _button('Entrar'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _field (bool obscure, String myHintText) {
    return TextFormField(
      obscureText: obscure,
      style: style,
      decoration: InputDecoration(
        hintText: myHintText,
        alignLabelWithHint: true,
        labelStyle: style,
        border: InputBorder.none,
      ),
    );
  }

  Widget _button(String nome) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 50.0,
      buttonColor: Colors.pinkAccent,
      child: RaisedButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          nome,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}
