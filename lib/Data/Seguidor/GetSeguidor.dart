// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_application_ecoment_inicial/Data/dados.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/repository/pessoaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSeguidor{
  Dados dados = Dados();
  GetSeguidor();

  Future<List<Pessoa>> listaUsuariosSeguindo(int idUsuarioWeb) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/seguidor/verSeguindo/${idUsuarioWeb}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
        PessoaRepository pessoaRepo = PessoaRepository();
        List listaUsuariosSeguindo = jsonDecode(response.body) as List;
        return pessoaRepo.listaPessoa = listaUsuariosSeguindo.map((e) => Pessoa.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Pessoa>> listaUsuariosSeguidores(int idUsuarioWeb) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/seguidor/verSeguidores/${idUsuarioWeb}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
        PessoaRepository pessoaRepo = PessoaRepository();
        List listaUsuariosSeguindo = jsonDecode(response.body) as List;
        return pessoaRepo.listaPessoa = listaUsuariosSeguindo.map((e) => Pessoa.fromJson(e)).toList();
    }
    return [];
  }
}