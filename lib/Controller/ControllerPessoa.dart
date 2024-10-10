import 'dart:convert';

import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  
  /* static Future<void> savePessoa(Pessoa pessoa) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pessoaJson = jsonEncode(pessoa.toJson());
    prefs.setString('pessoa', pessoaJson);
  } */

  static Future<Pessoa?> getPessoa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pessoaJson = prefs.getString('pessoa');
    if (pessoaJson != null){
      Map<String, dynamic> pessoaMap = jsonDecode(pessoaJson);
      return Pessoa.fromJson(pessoaMap);
    }
    return null;
  }

  static Future<void> removePessoa() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('pessoa');
  }
}