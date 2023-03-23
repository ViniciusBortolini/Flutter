import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe os seus dados";

  void resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _infoText = "Informe os seus dados";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso! IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideia! IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Acima do peso! IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 29.9 && imc < 24.9) {
        _infoText = "Obesidade Grau I! IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II! IMC: ${imc.toStringAsPrecision(3)}";
      } else if (imc >= 39.9) {
        _infoText = "Obesidade Grau III! IMC: ${imc.toStringAsPrecision(3)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(icon: const Icon(Icons.refresh), onPressed: resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.person_add_alt_outlined,
                      size: 120.0, color: Colors.green),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle:
                          TextStyle(color: Colors.green, fontSize: 25.0),
                    ),
                    textAlign: TextAlign.center,
                    controller: pesoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu peso";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle:
                            TextStyle(color: Colors.green, fontSize: 25.0),
                        hintText: "Digite sua altura"),
                    textAlign: TextAlign.center,
                    controller: alturaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua altura";
                      } else if (double.tryParse(value) == null) {
                        return "Insira um valor numérico";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcular();
                      }
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 25.0),
                  ),
                ],
              )),
        ));
  }
}
