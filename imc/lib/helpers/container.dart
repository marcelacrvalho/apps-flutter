import 'package:flutter/material.dart';

class CustomizedContainer extends StatelessWidget {
  final Widget widget;
  final Color cor;

  CustomizedContainer({this.widget, this.cor = Colors.white10});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: widget,
    );
  }
}
