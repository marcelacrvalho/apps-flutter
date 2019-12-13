import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _pesoController = new TextEditingController(); // PEGAR O QUE O USUÁRIO DIGITOU
  TextEditingController _alturaController = new TextEditingController();
  String _informacao = '';

  void _resetar() { // RESETAR DADOS INSERIDOS AO CLICAR NO BOTÃO DE REFRESH
   _pesoController.text = '';
    _alturaController.text = '';
   setState(() {
    _informacao = '';
   });
  }

  void _calcular() {
    double _peso = double.parse(_pesoController.text); // pegando os dados do controller e transformando em double
    double _altura = double.parse(_alturaController.text) / 100;
    double _imc = _peso / (_altura * _altura);
    setState(() { // CHAMA-SE O SET STATE POIS ELA MUDARÁ O TEXTO CONFORME OS DADOS SÃO INSERIDOS
      _imc = _peso / (_altura * _altura);
        if (_imc < 18.6) {
        _informacao = 'Abaixo do peso (${_imc.toStringAsPrecision(3)})';
      } else if (_imc > 18.6 && _imc < 20.0) {
        _informacao = 'IMC está dentro do ideal (${_imc.toStringAsPrecision(3)})';
      } else {
        _informacao = 'Acima do peso (${_imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: <Widget>[ // COLOCAR BOTÕES NA MINHA BARRA
          IconButton(
            icon: Icon(Icons.refresh), // TIPO DE BOTÃO QUE QUERO
            onPressed: _resetar, // TODA VEZ QUE APERTAR, CHAMARÁ A FUNÇÃO RESETAR
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Form( // PARA FAZER VALIDAÇÃO DE COISAS ESCRITAS PELO USUÁRIO
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.supervised_user_circle,
                      color: Colors.blueGrey, size: 100.0),
                  TextFormField(
                    controller: _pesoController, // INFORMANDO QUEM É MEU CONTROLLER
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Insira sua altura!';
                      }
                    },
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      labelStyle:
                          TextStyle(color: Colors.blueAccent, fontSize: 12.0),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  TextFormField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                    validator: (value){
                      if (value.isEmpty) {
                        return 'Insira seu peso!';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle:
                          TextStyle(color: Colors.blueAccent, fontSize: 12.0),
                    ),
                  ),
                  Divider(color: Colors.transparent),
                  RaisedButton(
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        _calcular();
                      }
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                  ),
                  Divider(color: Colors.transparent),
                  Text(
                    _informacao,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 18.0)
                    ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
