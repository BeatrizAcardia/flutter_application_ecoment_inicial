import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/Data/dados.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class GetPostagem{
  Dados dados = Dados();

  GetPostagem();

  Future<List<Ideia>> listaIdeiasByMaterialPostagem(int materialPostagem) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem/byMaterialPostagem/${materialPostagem}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      IdeiaRepository ideiaRepo = IdeiaRepository();
      List listaIdeias_ = jsonDecode(response.body) as List;
      return ideiaRepo.listaIdeias = listaIdeias_.map((e) => Ideia.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Ideia>> listaIdeiasAll() async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      IdeiaRepository ideiaRepo = IdeiaRepository();
      List listaIdeias_ = jsonDecode(response.body) as List;
      return ideiaRepo.listaIdeias = listaIdeias_.map((e) => Ideia.fromJson(e)).toList();
    }
    return [];
  }

    Future<List<Ideia>> findIdeiaByNomeUsuario(String nomeUsuario) async{
    print(nomeUsuario);
    var url = Uri.parse(
          "http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem/byNomeUsuario/${nomeUsuario}");
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

  Future<List<Ideia>> listaIdeiasMaisCurtidas() async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem/maisAvaliadas");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      IdeiaRepository ideiaRepo = IdeiaRepository();
      List listaIdeias_ = jsonDecode(response.body) as List;
      return ideiaRepo.listaIdeias = listaIdeias_.map((e) => Ideia.fromJson(e)).toList();
    }
    return [];
  }

  Future<List<Ideia>> listaIdeiaSeguindo(int idSeguindo) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/seguidor/ByIdSeguidor/${idSeguindo}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var url2 = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/seguidor/ByIdSeguindo");
      http.Response response2 = await http.get(url2);
      if(response2.statusCode == 200){
        var url3 = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem/ideiasByNomeWeb");
        http.Response response3 = await http.get(url3);
        IdeiaRepository ideiaRepo = IdeiaRepository();
        List listaIdeiasSeguindo_ = jsonDecode(response3.body) as List;
        return ideiaRepo.listaIdeias = listaIdeiasSeguindo_.map((e) => Ideia.fromJson(e)).toList();
      }
    }
    return [];
  }

}