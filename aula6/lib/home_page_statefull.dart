import 'package:flutter/material.dart';

class HomePageStateFull extends StatefulWidget {
  HomePageStateFull() {
    print('Construtor de HomePageStateFull');
  }

  @override
  State<StatefulWidget> createState() {
    print('Criando Estado da HomePageStateFull');
    return HomePageStateFullState();
  }
}

class HomePageStateFullState extends State<HomePageStateFull> {
  String texto = "Texto Inicial";
  @override
  Widget build(BuildContext context) {
    print('Build de StateFullState');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(texto),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    texto = "Texto Alterado";
                  });
                },
                child: Text("Alterar Texto"))
          ],
        ),
      ),
    );
  }
}
