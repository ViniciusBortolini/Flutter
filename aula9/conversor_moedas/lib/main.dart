import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//necessário para usar jsonDecode
import 'dart:convert';

void main() async {
  await buscaDados();
  runApp(const MaterialApp(
    home: Home(),
  ));
}

Future buscaDados() async {
  var url =
      Uri.parse("https://api.hgbrasil.com/finance?format=json&key=3850d768");
  var response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao acessar a API: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocorreu um erro: $e');
    return Null;
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar = 0;
  double euro = 0;

  void _realChanged(String text) {
    double real = double.parse(text);
    print(dolarController.text = (real / dolar).toStringAsFixed(2));
    print(euroController.text = (real / euro).toStringAsFixed(2));
  }

  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    // vamos pegar o dolar que o usuário digitou e mult pela cotação do jSON
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    double euro = double.parse(text);
    // vamos pegar o dolar que o usuário digitou e mult pela cotação do jSON
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(" \$ Conversor \$ "),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: buscaDados(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    "Carregando Dados...",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Erro ao carregar os dados...",
                      style: TextStyle(color: Colors.amber, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Icon(Icons.monetization_on,
                            size: 150.0, color: Colors.amber),
                        construiMeusCamposDeTexto(
                            "Reais", "R\$", realController, _realChanged),
                        const Divider(),
                        construiMeusCamposDeTexto(
                            "Dólares", "US\$", dolarController, _dolarChanged),
                        const Divider(),
                        construiMeusCamposDeTexto(
                            "Reais", "EUR€ ", euroController, _euroChanged),
                      ],
                    ),
                  );
                }
            }
          },
        ));
  }
}

Widget construiMeusCamposDeTexto(
    String label, String prefix, TextEditingController value, Function funcao) {
  return TextField(
    controller: value,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.amber),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 0.0)),
      prefixText: prefix,
      prefixStyle: const TextStyle(color: Colors.amber, fontSize: 25.0),
    ),
    style: const TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: funcao as void Function(String)?,
    keyboardType: TextInputType.number,
  );
}
