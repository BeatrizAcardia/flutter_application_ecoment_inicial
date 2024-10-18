// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_application_ecoment_inicial/Data/dados.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostPostagem{
  Dados dados = Dados();

  Future<void> avaliarIdeia(int idUsuarioWeb, int idPostagem, int valor, String nomeUsuarioDono) async{
    try{
      var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/avaliacao/avaliar/${idUsuarioWeb}/${idPostagem}/${valor}/${nomeUsuarioDono}");
    http.Response response = await http.post(url);
    if(response.statusCode == 200){
      print("Ideia avaliada com sucesso!");
    }else{
      print("Erro ao avaliar ideia");
    }
    }catch(e){
      print("Erro na requisição: $e");
    }
  }
    Future<void> reavaliarIdeia(int idUsuarioWeb, int idPostagem, int valor, String nomeUsuarioDono) async{
    try{
      var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/avaliacao/reavaliar/${idUsuarioWeb}/${idPostagem}/${valor}/${nomeUsuarioDono}");
    http.Response response = await http.post(url);
    if(response.statusCode == 200){
      print("Ideia avaliada com sucesso!");
    }else{
      print("Erro ao avaliar ideia");
    }
    }catch(e){
      print("Erro na requisição: $e");
    }
  }

}