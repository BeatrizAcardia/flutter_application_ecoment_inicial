import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:provider/provider.dart';

class Funcionalidades {
  Funcionalidades();

  void Sair(BuildContext context, UsuarioProvider user) {
    user.setUsername("");
    user.setEmail("");
    user.setSenha("");
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Myinicial(),),(route) => false,);
  }
}
