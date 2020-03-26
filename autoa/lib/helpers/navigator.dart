import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future navigator(context, proximaPagina) {
  return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: proximaPagina));
}

bool navigatorPop(context) {
  return Navigator.pop(context);
}

Future navigatorReplacement(context, proximaPagina) {
  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return proximaPagina;
  }));
}