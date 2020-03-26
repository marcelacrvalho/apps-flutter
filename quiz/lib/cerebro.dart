import 'package:quiz/perguntas.dart';

class Cerebro {

  int _index = 0;
  List<Perguntas> _bancoPerguntas = [
    Perguntas(
        pergunta: 'O IDH do Brasil é maior que o do Uruguay', resposta: false),
    Perguntas(
        pergunta: 'Dia 7 de Setembro se comemora a Proclamação da República',
        resposta: false),
    Perguntas(
        pergunta: 'Tiradentes lutava para tornar o Brasil livre de Portugal',
        resposta: false),
    Perguntas(
        pergunta: 'Os primeiros descobridores do país não foram os portugueses',
        resposta: true),
    Perguntas(pergunta: 'Brasil já foi colônia espanhola', resposta: false),
    Perguntas(
        pergunta: 'O Rio Paraná passa por 3 países da América do Sul',
        resposta: true),
    Perguntas(
        pergunta:
            'O Brasil só deu fim a escravidão por insistência dos ingleses',
        resposta: true),
    Perguntas(
        pergunta: 'O país nunca participou de uma guerra', resposta: false),
    Perguntas(
        pergunta: 'A Farroupilha uniu os descendentes de africanos e europeus',
        resposta: true),
    Perguntas(
        pergunta: 'O país nunca foi espionado pelo Pentágono', resposta: false),
    Perguntas(
        pergunta: 'Navios negreiros eram excelentes meios de embarcação',
        resposta: false),
    Perguntas(
        pergunta: 'UAI, significa União, Amor e Igualdade', resposta: true),
    Perguntas(
        pergunta:
            'Na bandeira de Minas Gerais é possível ler "Liberdade ainda que tardia" em Latin',
        resposta: true),
  ];

  String getPergunta() {
    return _bancoPerguntas[_index].pergunta;
  }

  bool getResposta() {
    return _bancoPerguntas[_index].resposta;
  }

  void proximaPergunta() {
    if (_index < _bancoPerguntas.length - 1) {
      _index++;
    } 
  }

  bool isFinished() {
    if(_index == _bancoPerguntas.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _index = 0;
  }

  int perguntasLenght() {
    return _bancoPerguntas.length;
  }
}
