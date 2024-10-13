import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class GetPostagem{
  String ipMaquina = "192.168.3.115";

  GetPostagem();

  Future<List<Ideia>> listaIdeiasByMaterialPostagem(int materialPostagem) async{
    var url = Uri.parse("http://${ipMaquina}:8080/Ecomoment/postagem/byMaterialPostagem/${materialPostagem}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      IdeiaRepository ideiaRepo = IdeiaRepository();
      List listaIdeias_ = jsonDecode(response.body) as List;
      return ideiaRepo.listaIdeias = listaIdeias_.map((e) => Ideia.fromJson(e)).toList();
    }
    return [];
  }
  Future<List<Ideia>> listaIdeiasAll() async{
    var url = Uri.parse("http://${ipMaquina}:8080/Ecomoment/postagem");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      IdeiaRepository ideiaRepo = IdeiaRepository();
      List listaIdeias_ = jsonDecode(response.body) as List;
      return ideiaRepo.listaIdeias = listaIdeias_.map((e) => Ideia.fromJson(e)).toList();
    }
    return [];
  }

}