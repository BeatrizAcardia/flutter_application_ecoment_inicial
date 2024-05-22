// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';
import 'package:flutter_application_ecoment_inicial/views/sobre_nos.dart';

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({super.key});

  @override
  State<WidgetDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<WidgetDrawer> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return 
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Menu",textAlign: TextAlign.center, style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),)),
            ListTile(
              leading: Icon(Icons.person_2_outlined, color: Colors.black,),
              title: Text("Perfil"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.black,),
              title: Text("Início"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myinicial(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.black,),
              title: Text("Pontos de coleta"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.black,),
              title: Text("Sobre nós"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SobreNos(),));
              },
            ),
          ],
        ),
      );
  }
}