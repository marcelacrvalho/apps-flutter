import 'package:flutter/material.dart';
import 'package:imc/helpers/constantes.dart';

class CustomizedIcon extends StatelessWidget {
  final Icon icon;
  final String texto;
  final Widget widget;

  CustomizedIcon({this.icon, this.texto, this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        icon,
        _appTextGenero(),
      ],
    );
  }

  Widget _appTextGenero() {
    return Text(
      texto,
      style: TXTLABEL,
    );
  }
}
