import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaRepository.dart';
import 'package:flutter_application_ecoment_inicial/repository/pessoaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class Get {
  Get();

  //Metodo para buscar Usuario a partir do email
  Future<Pessoa> buscarPessoaByEmail(String email, BuildContext context) async {
    try {
      var url = Uri.parse(
          "http://192.168.3.115:8080/Ecomoment/usuario/verificaUsuarioByEmail/${email}");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Pessoa usuario = Pessoa.n();
        return usuario = Pessoa.fromJson(jsonDecode(response.body));
      } else {
        print("[buscarPessoaByEmail] Erro StatusCode != 200. Status: ${response.statusCode}");
        return Pessoa.n();
      }
    } catch (e) {
      print("[buscarPessoaByEmail] Catch - Erro: $e");
      return Pessoa.n();
    }
  }

  Future<void> buscarPessoaByEmailAndSet(
      String email, BuildContext context) async {
    try {
      var url = Uri.parse(
          "http://192.168.3.115:8080/Ecomoment/usuario/verificaUsuarioByEmail/${email}");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Pessoa usuario = Pessoa.n();
        usuario = Pessoa.fromJson(jsonDecode(response.body));
        UsuarioProvider user =
            Provider.of<UsuarioProvider>(context, listen: false);
        user.setUsuarioProvider(UsuarioProvider.fromPessoa(usuario));
        print(usuario.toString());
      } else {
        print("[buscarPessoaByEmailAndSet] Erro StatusCode != 200. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("[buscarPessoaByEmailAndSet] Catch - Erro: $e");
    }
  }

  Future<bool> verificaUsuarioExistente(String nome, String email) async {
    try {
      var url = Uri.parse("http://192.168.3.115:8080/Ecomoment/usuario/verificaUsuarioByNomeAndEmail/$nome/$email");
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        PessoaRepository pRepo = PessoaRepository();
        List listaUsuarios = jsonDecode(response.body) as List;
        // Converte a lista JSON para uma lista de objetos Pessoa
        pRepo.listaPessoa = listaUsuarios.map((e) => Pessoa.fromJson(e)).toList();
        if (listaUsuarios.isEmpty) {
          print("[verificaUsuarioExistente] Nenhum usuário encontrado.");
          return false;
        } else {
          print(
              "[verificaUsuarioExistente] Usuários encontrados: ${listaUsuarios.toString()}");
          return true;
        }
      } else {
        print("[verificaUsuarioExistente] Erro StatusCode != 200. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("[verificaUsuarioExistente] Catch - Erro: $e");
    }

    return false; // Retorna false em caso de erro ou se o código não for 200
  }

  Future<bool> verificaUsuarioByEmailOrUsernameAndSenha(String emailOrUsername, String senha) async {
    try {
      var url = Uri.parse(
          "http://192.168.3.115:8080/Ecomoment/usuario/verificaUsuarioByEmailOrUsernameAndSenha/${emailOrUsername}/${senha}");
      http.Response response = await http.get(url);
        Map<String, dynamic> dadosAPI = jsonDecode(response.body);
        if (dadosAPI == null) {
          print(dadosAPI.toString());
          return false;
        } else {
          Pessoa usuario_a = Pessoa.n();
          usuario_a = Pessoa.fromJson(dadosAPI);
          print(dadosAPI.toString());
          return true;
        }
    } catch (e, stackTrace) {
      print('Erro na requisição: $e');
      print('StackTrace: $stackTrace');
      return false;
    }
  }

    Future<bool> verificaUsuarioByEmailOrUsernameAndSenhaAndSet(String emailOrUsername, String senha, BuildContext context) async {
    try {
      var url = Uri.parse(
          "http://192.168.3.115:8080/Ecomoment/usuario/verificaUsuarioByEmailOrUsernameAndSenha/${emailOrUsername}/${senha}");
      http.Response response = await http.get(url);
        Map<String, dynamic> dadosAPI = jsonDecode(response.body);
        if (dadosAPI == null) {
          print(dadosAPI.toString());
          return false;
        } else {
          Pessoa usuario_a = Pessoa.n();
          usuario_a = Pessoa.fromJson(dadosAPI);
          UsuarioProvider user =
            Provider.of<UsuarioProvider>(context, listen: false);
        user.setUsuarioProvider(UsuarioProvider.fromPessoa(usuario_a));
          print(dadosAPI.toString());
          return true;
        }
    } catch (e, stackTrace) {
      print('Erro na requisição: $e');
      print('StackTrace: $stackTrace');
      return false;
    }
  }

  Future<List<Ideia>> findIdeiaByNomeUsuario(String nomeUsuario) async{
    print(nomeUsuario);
    var url = Uri.parse(
          "http://192.168.3.115:8080/Ecomoment/postagem/byNomeUsuario/${nomeUsuario}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      List listaIdeia = jsonDecode(response.body) as List;
      listaIdeia.forEach(
        (element) {
          print(element.toString());
        },
      );
      IdeiaRepository ideiaRepo = IdeiaRepository();
      ideiaRepo.listaIdeias = listaIdeia.map((e) => Ideia.fromJson(e)).toList();
      return ideiaRepo.listaIdeias;
    }
    return [];
  }
}


