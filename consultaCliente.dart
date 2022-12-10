import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/acesso_api.dart';
import 'package:flutter_application_1/model/pessoa.dart';
import 'package:flutter_application_1/paginas/home.dart';
import 'package:flutter_application_1/util/componentes.dart';

class ConsultaCliente extends StatefulWidget {
  const ConsultaCliente({super.key});

  @override
  State<ConsultaCliente> createState() => _ConsultaClienteState();
}

class _ConsultaClienteState extends State<ConsultaCliente> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtCidade = TextEditingController();
  List<Cliente> lista = [];
  @override
  Widget build(BuildContext context) {
    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    buscaPorCidade() async {
      List<Cliente> clientes =
          await AcessoApi().ListaClientePorCidade(int.parse(txtCidade.text));
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
                .criaBotao(formController, buscaPorCidade(), "Listar Todas"),
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
