import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String texto = "Texto Inicial";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Texto Inicial"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  texto = "Texto Alterado";
                },
                child: Text("Alterar Texto")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/statefull');
                },
                child: Text("Ir para StateFull")),
          ],
        ),
      ),
    );
  }
}
