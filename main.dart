import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/cadastro.dart';
import 'package:flutter_application_1/paginas/consulta.dart';
import 'package:flutter_application_1/paginas/consultaCliente.dart';
import 'package:flutter_application_1/paginas/home.dart';
import 'package:flutter_application_1/util/tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().criaTema(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        'consulta': (context) => const Consulta(),
        '/cadastro': (context) => Cadastro(),
        '/consultac': (context) => ConsultaCliente(),
      },
    );
  }
}
