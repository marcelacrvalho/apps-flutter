import 'dart:math';

class Desafios {

  int _index = 0;
  List<String> _desafios = [
    'Pronto para começar',
    'Vire toda a sua dose',
    'Convide alguém para virar uma dose com você',
    'Dê um beijo de cinema na pessoa mais cheirosa do rolê',
    'Passe um trote',
    'Convide um estranho para fazer parte da brincadeira',
    'Todos cantam Evidências bem alto',
    'Dê um selinho em alguma pessoa do mesmo sexo que o seu',
    'Se declare para o crush do rolê e poste no storie',
    'Todos viram uma dose',
    'A pessoa mais bonita do rolê vira duas doses seguidas'
  ];

  String getDesafio() {
    return _desafios[_index];
  }

  bool isFinished() {
    if (_index == _desafios.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int updateIndex() {
    if (_index < _desafios.length - 1) {
      return _index++;
    }
    return _index;
  }

  void resetar() {
    _index = 0;
  }
}