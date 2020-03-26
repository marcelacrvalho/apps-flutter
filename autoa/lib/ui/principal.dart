import 'package:autoa/helpers/constantes.dart';
import 'package:autoa/helpers/navigator.dart';
import 'package:autoa/helpers/widgets/marcador.dart';
import 'package:autoa/ui/carros.dart';
import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: ListView(
        children: <Widget>[
          _cardTipoCarro(
             () => _exibirSuv(context),
            childWidget: Stack(
              children: <Widget>[
                _imagemTipoCarro(IMAGEMSUV),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(child: MarcadorAmarelo(width: 40.0)),
                        Text(
                          'SUV',
                          style: ESTILOMEDIO,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _cardTipoCarro(
             () => _exibirPicape(context),
            childWidget: Stack(
              children: <Widget>[
                _imagemTipoCarro(IMAGEMPICAPE),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(child: MarcadorAmarelo()),
                        Text(
                          'PICAPE',
                          style: ESTILOMEDIO,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _cardTipoCarro(
             () => _exibirSedan(context),
            childWidget: Stack(
              children: <Widget>[
                _imagemTipoCarro(IMAGEMSEDAN),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(child: MarcadorAmarelo()),
                        Text(
                          'SEDAN',
                          style: ESTILOMEDIO,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _cardTipoCarro(
            () => _exibirHatch(context),
            childWidget: Stack(
              children: <Widget>[
                _imagemTipoCarro(IMAGEMHATCH),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Positioned(child: MarcadorAmarelo()),
                        Text(
                          'HATCH',
                          style: ESTILOMEDIO,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTipoCarro(function, {childWidget}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: childWidget,
      ),
    );
  }

  Widget _imagemTipoCarro(nome) {
    return Image.asset(nome);
  }

  void _exibirSedan(context) {
    navigator(context, Carros('luxo'));
  }

  void _exibirHatch(context) {
    navigator(context, Carros('esportivos'));
  }

  void _exibirPicape(context){
    navigator(context, Carros('classicos'));
  }

  void _exibirSuv(context){
    navigator(context, Carros('esportivos'));
  }
}
