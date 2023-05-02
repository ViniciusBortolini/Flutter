import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  int _pontosnos = 0, _pontoseles = 0, _vitoriaNos = 0, _vitoriaEles = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/fundo.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Row(
          children: [
            const Padding(padding: EdgeInsets.all(40)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Nós: $_pontosnos",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            _changePontosNos(1);
                          },
                          child: const Text(
                            "+1",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ))),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            _changePontosNos(-1);
                          },
                          child: const Text(
                            "-1",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ))),
                ]),
                ElevatedButton(
                    onPressed: () {
                      _changePontosNos(3);
                    },
                    child: const Text(
                      "Truco",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )),
                Text("Vitorias: $_vitoriaNos"),
              ],
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Eles: $_pontoseles",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            _changePontosEles(1);
                          },
                          child: const Text(
                            "+1",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ))),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            _changePontosEles(-1);
                          },
                          child: const Text(
                            "-1",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ))),
                ]),
                ElevatedButton(
                    onPressed: () {
                      _changePontosEles(3);
                    },
                    child: const Text(
                      "Truco",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )),
                Text("Vitorias: $_vitoriaEles"),
              ],
            ),
          ],
        )
      ],
    );
  }

  void _changePontosNos(int valor) {
    setState(() {
      _pontosnos = _verificaPonto(_pontosnos, valor);
      if (_pontosnos == 12) {
        _vitoriaNos++;
        _pontoseles = 0;
        _pontosnos = 0;
      }
    });

    /*if ((_pontosnos + valor) <= 12) {
      setState(() {
        _pontosnos += valor;
      });
    } else {
      setState(() {
        _pontosnos = 12;
      });
    }*/
  }

  void _changePontosEles(int valor) {
    setState(() {
      _pontoseles = _verificaPonto(_pontoseles, valor);
      if (_pontoseles == 12) {
        _vitoriaEles++;
        _pontoseles = 0;
        _pontosnos = 0;
      }
    });
  }

  int _verificaPonto(int valorTotal, int valor) {
    if (valorTotal + valor <= 12) {
      return valorTotal + valor;
    } else {
      return 12;
    }
  }

  void _verificaVitoria(int pontos) {
    if (pontos == 12) {}
  }
}
