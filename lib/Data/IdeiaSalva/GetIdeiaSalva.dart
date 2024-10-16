import 'package:flutter_application_ecoment_inicial/Data/dados.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/models/ideiaSalva.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaRepository.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaSalvaRepository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetIdeiaSalva{
  Dados dados = Dados();

  GetIdeiaSalva();

  Future<List<Ideia>> listaIdeiasSalvasByIdUsuarioWeb(int idUsuarioWeb) async{
    var url = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/salvos/ByIdUsuarioWeb/${idUsuarioWeb}");
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var url2 = Uri.parse("http://${dados.ipMaquina}:${dados.porta}/Ecomoment/postagem/ideiasByIdPostagem");
      http.Response response2 = await http.get(url2);
      if(response2.statusCode == 200){
        IdeiaRepository ideiaRepo = IdeiaRepository();
        List listaIdeiasSalvasByIdUsuario_ = jsonDecode(response2.body) as List;
        return ideiaRepo.listaIdeias = listaIdeiasSalvasByIdUsuario_.map((e) => Ideia.fromJson(e)).toList();
      }
    }
    
    return [];
  }
}