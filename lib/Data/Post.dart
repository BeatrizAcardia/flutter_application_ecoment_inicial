
import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/repository/pessoaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class Post{

  Post();

    Future<void> cadastrarPessoaEmailSenha(
      String username, String email, String password) async {
    var url = Uri.parse(
        "http://192.168.3.115:8080/Ecomoment/usuario/cadastrar/@${username}/${email}/${password}");
    http.Response response = await http.post(url);
    if (response.statusCode == 200) {
      print('Pessoa cadastrada com sucesso');
    } else {
      print('Erro ao cadastrar pessoa');
    }
  }
}