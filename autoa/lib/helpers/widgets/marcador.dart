import 'package:flutter/material.dart';

class MarcadorAmarelo extends StatelessWidget {
  final double width;
  final double heigh;

  MarcadorAmarelo({this.width = 65.0, this.heigh = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.yellow,
      ),
    );
  }
}
