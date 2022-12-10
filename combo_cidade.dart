import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/acesso_api.dart';
import 'package:flutter_application_1/model/cidade.dart';

class ComboCidade extends StatefulWidget {
  TextEditingController? controller;

  ComboCidade({super.key, required TextEditingController controller});

  @override
  State<ComboCidade> createState() => _ComboCidadeState();
}

class _ComboCidadeState extends State<ComboCidade> {
  int? cidadesel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1))
          .then((value) => AcessoApi().listaCidades()),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<Cidade> cidade = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              isExpanded: true,
              value: cidadesel,
              icon: const Icon(Icons.arrow_downward),
              hint: const Text('Selecione uma cidade....'),
              elevation: 16,
              onChanged: (int? value) {
                setState(() {
                  cidadesel = value;
                  widget.controller?.text = "$value";
                });
              },
              items: cidade.map<DropdownMenuItem<int>>((Cidade cidade) {
                return DropdownMenuItem<int>(
                    value: cidade.id, child: Text(cidade.nome));
              }).toList(),
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              Text('Carregando  Cidades')
            ],
          );
        }
      },
    );
  }
}
