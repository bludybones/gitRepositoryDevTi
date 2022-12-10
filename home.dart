import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/paginas/cadastro.dart';
import 'package:flutter_application_1/paginas/consulta.dart';
import 'package:flutter_application_1/paginas/consultaCliente.dart';
import 'package:flutter_application_1/util/componentes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    cadastro() {
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    consulta() {
      Navigator.of(context).pushReplacementNamed('/consulta');
    }

    consultaC() {
      Navigator.of(context).pushReplacementNamed('/consultaC');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao(formController, cadastro(), "Cadastro Cliente"),
            Componentes()
                .criaBotao(formController, consulta(), "Consulta Cidade"),
            Componentes()
                .criaBotao(formController, consultaC(), "Consulta Cliente"),
            Componentes()
                .criaBotao(formController, cadastro(), "Cadastro Cidade"),
          ],
        ),
      ),
    );
  }
}
