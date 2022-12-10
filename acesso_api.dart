import 'dart:convert';

import 'package:flutter_application_1/model/cidade.dart';
import 'package:flutter_application_1/model/pessoa.dart';
import 'package:http/http.dart';

class AcessoApi {
  Future<List<Cliente>> listarTodos() async {
    String url = 'http://localhost:8080/cliente';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable I = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes =
        List<Cliente>.from(I.map((p) => Cliente.fromJson(p)));
    return clientes;
  }

  Future<List<Cidade>> listaCidades() async {
    String url = 'http://localhost:8080/cidade';
    Response resposta = await get(Uri.parse(url));
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable I = json.decode(jsonFormatadoUtf8);
    List<Cidade> cidades = List<Cidade>.from(I.map((c) => Cidade.fromJson(c)));
    return cidades;
  }

  Future<List<Cidade>> excluirCidade() async {
    String url = 'http://localhost:8080/excluiCidade';
    Response resposta = await get(Uri.parse(url));
    return excluirCidade();
  }

  Future<List<Cliente>> excluirCliente() async {
    String url = 'http://localhost:8080/excluiCliente';
    Response resposta = await get(Uri.parse(url));
    return excluirCliente();
  }

  Future<void> inserirCidade(Map<String, dynamic> cidade) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    Response resposta =
        await post(Uri.parse(url), headers: headers, body: json.encode(cidade));
  }

  Future<void> inserirCliente(Map<String, dynamic> pessoa) async {
    String url = 'http://localhost:8080/cliente';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    Response resposta =
        await post(Uri.parse(url), headers: headers, body: json.encode(pessoa));
  }

  Future<List<Cliente>> ListaClientePorCidade(int cidade) async {
    String url = 'http://localhost:8080/cliente/busca-por-cidade/$cidade';
    Response resposta = await get(Uri.parse(url));
    print(resposta);
    String jsonFormatadoUtf8 = (utf8.decode(resposta.bodyBytes));
    Iterable I = json.decode(jsonFormatadoUtf8);
    List<Cliente> clientes =
        List<Cliente>.from(I.map((p) => Cidade.fromJson(p)));
    return clientes;
  }
}
