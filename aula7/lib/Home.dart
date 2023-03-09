import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _numAlunos = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/fundo.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_numAlunos",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numAlunos++;
                        });
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ))),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _numAlunos--;
                        });
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ))),
            ]),
            Text(
              "Pode Entrar!",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
          ],
        )
      ],
    );
  }
}
