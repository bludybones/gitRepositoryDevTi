import 'package:flutter/material.dart';

import 'package:flutter_application_1/api/acesso_api.dart';
import 'package:flutter_application_1/model/cidade.dart';
import 'package:flutter_application_1/model/pessoa.dart';
import 'package:flutter_application_1/util/combo_cidade.dart';
import 'package:flutter_application_1/util/componentes.dart';
import 'package:flutter_application_1/util/radio_sexo.dart';

class Cadastro extends StatefulWidget {
  TextEditingController? controller;

  Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> formController = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSexo = TextEditingController();
  TextEditingController txtIdade = TextEditingController();
  TextEditingController txtCidade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    cadastrar() {
      Cliente p = Cliente(0, txtNome.text, txtSexo.text,
          int.parse(txtIdade.text), Cidade(int.parse(txtCidade.text), "", ""));
      AcessoApi().inserirCliente(p.toJson());
      Navigator.of(context).pushReplacementNamed('/cadastro');
    }

    home() {
      Navigator.of(context).pushReplacementNamed('/home');
    }

    return Scaffold(
      appBar: Componentes().criaAppBar("utilização API", home),
      body: Form(
        key: formController,
        child: Column(
          children: [
            Componentes().criaInputTexto(
                TextInputType.text, "nome", txtNome, "Informe o Nome"),
            Componentes().criaInputTexto(
                TextInputType.number, "idade", txtIdade, "iNFORMA A idade"),
            Center(child: RadioSexo(controller: txtSexo)),
            Center(child: ComboCidade(controller: txtCidade)),
            Componentes().criaBotao(formController, Cadastro(), "cadastrar"),
          ],
        ),
      ),
    );
  }
}
