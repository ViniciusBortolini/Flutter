import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppWidget.dart';

main() {
  /*
  runApp(Container(
      child: Center(
    child: Text(
      "meu texto",
      textDirection: TextDirection.ltr,
      style: TextStyle(
          color: Colors.blue, fontSize: 20, backgroundColor: Colors.pink),
    ),
  )));
  */
  runApp(AppWidget());
}

//Antes
/*
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Center(child: Text('Olá Mundo')),
      ),
    );
  }
}*/

//Depois




//Antes
/*
class paginaInicialEstado extends State<paginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Teste')),
    );
  }
}*/

