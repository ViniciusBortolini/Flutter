import 'package:flutter/material.dart';

class paginaInicial extends StatefulWidget {
  @override
  State<paginaInicial> createState() {
    return paginaInicialEstado();
  }
}

class paginaInicialEstado extends State<paginaInicial> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        child: Text('O valor do contador: $contador'),
        onTap: () {
          setState(() {
            contador++;
          });
        },
      )),
    );
  }
}
