// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/Data/Usuario/GetUsuario.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/views/contaSemLogin.dart';
import 'package:flutter_application_ecoment_inicial/views/form-ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasReutilizacao.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';
import 'package:provider/provider.dart';

class WidgetBottomAppBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  Pessoa user = Pessoa.n();
  WidgetBottomAppBar({required this.scaffoldKey});

  @override
  State<WidgetBottomAppBar> createState() => _WidgetBottomAppBarState();
}

class _WidgetBottomAppBarState extends State<WidgetBottomAppBar> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsuarioProvider>(context, listen: false);
    return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              height: 75,
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Myinicial(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.pin_drop_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormIdeia(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.lightbulb_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IdeiasReutilizacao(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person_2_outlined, color: Colors.black),
                        onPressed: () {
                          user.email == "" ?
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SemLoginConta(),)) :
                          
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}