import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_aula/constants.dart';

import 'SecondaPage.dart';
import 'TerceiraPage.dart';
import 'firebase_options.dart';

void main() async {
  //inicia o firebase antes de iniciar o projeto
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //inicia conforme a plataforma: Android, IOS, Mac...
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor)),
      title: 'Estudando Rotas',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/segunda': (context) => SecondPage(),
        '/terceira': (context) => TerceiraPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Estudando Rotas'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/segunda');
                },
                child: const Text('Página 1'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/terceira');
                },
                child: const Text('Página 2'),
              ),
            ],
          ),
        ));
  }
}
