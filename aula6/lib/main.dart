import 'package:aula6/home_page_statefull.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Define os estilos e também rotas do nosso projeto, após isso chama onde está homePage.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Aula05',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.red),
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/statefull': (context) => HomePageStateFull(),
      },
    );
  }
}

 /*
      */