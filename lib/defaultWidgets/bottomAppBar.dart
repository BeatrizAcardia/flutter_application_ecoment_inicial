// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasReutilizacao.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

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
    return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              height: 75,
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 143, 142, 142),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Myinicial(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.pin_drop, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.lightbulb, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => IdeiasReutilizacao(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person_2, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          widget.scaffoldKey.currentState?.openDrawer();
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