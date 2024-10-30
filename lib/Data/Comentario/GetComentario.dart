// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter_application_ecoment_inicial/Data/dados.dart';
import 'package:flutter_application_ecoment_inicial/models/Comentarios.dart';
import 'package:flutter_application_ecoment_inicial/repository/ComentarioRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetComentario{
  Dados dados = Dados();

  GetComentario();

    Future<List<Comentarios>> listaComentarios(int idPostagem) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/comentario/ByIdPostagem/${idPostagem}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
        ComentarioRepository comentarioRepo = ComentarioRepository();
        List listaComentarios = jsonDecode(response.body) as List;
        return comentarioRepo.listaComentarios = listaComentarios.map((e) => Comentarios.fromJson(e)).toList();
    }
    return [];
  }

  

}