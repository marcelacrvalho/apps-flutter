import 'dart:math';

class CalculoBloc {
  final int altura;
  final int peso;
  double _imc;
  String _info;
  String _result;

  CalculoBloc(this.altura, this.peso);

  String getImc() {
     _imc = peso / pow(altura / 100, 2);
    return _imc.toStringAsFixed(1);
  }

  String getResult() {
     if (_imc >= 25) {
      _result = 'ACIMA DO PESO';
    }else if(_imc >= 18 && _imc < 25) {
      _result = 'IMC PERFEITO';
    } 
    else {
      _result = 'ABAIXO DO PESO';
    }
    return _result;
  }

  String getInfo() {
     if(_imc >= 18 && _imc < 25) {
      _info = 'SEU IMC É NORMAL. BOM TRABALHO! CONTINUE ASSIM!';
    } else if (_imc >= 25) {
       _info = 'SEU PESO É UM POUCO ACIMA DO NORMAL. TENTE EXERCITAR UM POUCO!';
    } else {
       _info = 'SEU PESO É UM POUCO ABAIXO DO NORMAL. TENTE COMER UM POUCO MAIS, DE FORMA SAUDÁVEL, CLARO!';
    }
    return _info;
  }
}