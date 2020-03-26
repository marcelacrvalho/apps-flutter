import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {

  final String texto;
  final Function onPressed;

  CustomizedButton({this.texto = 'CALCULAR', this.onPressed});
  
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8.0),
      height: size.height * 0.1,
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          texto,
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
    );
  }

  
}