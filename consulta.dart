import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/api/acesso_api.dart';
import 'package:flutter_application_1/model/pessoa.dart';
import 'package:flutter_application_1/paginas/home.dart';
import 'package:flutter_application_1/util/componentes.dart';

class Consulta extends StatefulWidget {
  const Consulta({super.key});

  @override
  State<Consulta> createState() => _ConsultaState();
}

class _ConsultaState extends State<Consulta> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  List<Cliente> lista = [];
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    listarTodos() async {
      //await AcessoApi().listaPessoa();
      List<Cliente> clientes = await AcessoApi().listarTodos();
      setState(() {
        lista = clientes;
      });
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes()
                .criaBotao(formController, listarTodos, "Listar Todas"),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, indice) {
                    return Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(5),
                      child: Componentes().criaItemPessoa(lista[indice]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
