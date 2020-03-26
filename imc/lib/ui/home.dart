import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc/bloc/calculo.dart';
import 'package:imc/enums/adicionar.dart';
import 'package:imc/enums/genero.dart';
import 'package:imc/helpers/button.dart';
import 'package:imc/helpers/constantes.dart';
import 'package:imc/helpers/container.dart';
import 'package:imc/helpers/icon.dart';
import 'package:imc/ui/resultado.dart';
import 'package:imc/widgets/slider.dart';

Genero generoSelecionado;
Adicionar botaoSelecionado;
int altura = 180;
int peso = 60;
int idade = 20;

CalculoBloc calc = CalculoBloc(altura, peso);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CALCULADORA DE IMC'),
      ),
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => atualizarGeneroSelecionado(Genero.masculino),
                      child: CustomizedContainer(
                        cor: generoSelecionado == Genero.masculino
                            ? CORATIVA
                            : CORINATIVA,
                        widget: CustomizedIcon(
                          icon: Icon(FontAwesomeIcons.mars,
                              size: 60.0, color: Colors.white),
                          texto: 'MASCULINO',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => atualizarGeneroSelecionado(Genero.feminino),
                      child: CustomizedContainer(
                        cor: generoSelecionado == Genero.feminino
                            ? CORATIVA
                            : CORINATIVA,
                        widget: CustomizedIcon(
                          icon: Icon(FontAwesomeIcons.venus,
                              size: 60.0, color: Colors.white),
                          texto: 'FEMININO',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: CustomizedContainer(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'SUA ALTURA',
                              style: TXTLABEL,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    altura.toString(),
                                    style: TXTDESTAQUE,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'CM',
                                    style: TXTLABEL,
                                  ),
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 18.0),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0),
                                overlayColor: Colors.pink,
                                thumbColor: Colors.pink,
                                activeTrackColor: Colors.pink,
                                inactiveTrackColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Slider(
                                value: altura.toDouble(),
                                min: 110.0,
                                max: 210.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    altura = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomizedContainer(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'SEU PESO',
                            style: TXTLABEL,
                          ),
                          Text(
                            peso.toString(),
                            style: TXTDESTAQUE,
                          ),
                          AppSlider(
                            widgetSliderChild: Slider(
                                value: peso.toDouble(),
                                min: 20.5,
                                max: 210.0,
                                onChanged: (double newValue) {
                                  _atualizarPeso(newValue);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomizedContainer(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'SUA IDADE',
                            style: TXTLABEL,
                          ),
                          Text(
                            idade.toString(),
                            style: TXTDESTAQUE,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () =>
                                    _atualizarIdade(Adicionar.menosIdade, -1),
                                child: Icon(FontAwesomeIcons.caretLeft,
                                    size: 50.0,
                                    color:
                                        botaoSelecionado == Adicionar.menosIdade
                                            ? CORBOTAO
                                            : CORINATIVA),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    _atualizarIdade(Adicionar.maisIdade, 1),
                                child: Icon(FontAwesomeIcons.caretRight,
                                    size: 50.0,
                                    color:
                                        botaoSelecionado == Adicionar.maisIdade
                                            ? CORBOTAO
                                            : CORINATIVA),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomizedButton(
              onPressed: () => _navigator(
                context,
                Resultado(calc.getImc(), calc.getResult(), calc.getInfo()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void atualizarGeneroSelecionado(Genero generoAtual) {
    setState(() {
      generoSelecionado = generoAtual;
    });
  }

  void _atualizarPeso(novoPeso) {
    setState(() {
      peso = novoPeso.round();
    });
  }

  void _atualizarIdade(Adicionar addIdade, totalAdicionar) {
    setState(() {
      botaoSelecionado = addIdade;
      idade += totalAdicionar;
    });
  }

  Future<Widget> _navigator(context, proximaPagina) async {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return proximaPagina;
    }));
  }
}
