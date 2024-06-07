// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/form-ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/login.dart';
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
          color: Color.fromARGB(255, 58, 125, 68),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "MENU",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Circe',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              leading: Icon(Icons.person_2_outlined, color: Colors.black),
              title: Text("Perfil", style: TextStyle(fontFamily: 'Nunito')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.black),
              title: Text("Início", style: TextStyle(fontFamily: 'Nunito')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myinicial(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.black),
              title: Text("Pontos de coleta", style: TextStyle(fontFamily: 'Nunito')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.groups, color: Colors.black),
              title: Text("Sobre nós", style: TextStyle(fontFamily: 'Nunito')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SobreNos(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.lightbulb, color: Colors.black),
              title: Text("Publicar ideia", style: TextStyle(fontFamily: 'Nunito')),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FormIdeia(),));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height-570,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro(),));
              },
              child: Text("Cadastre-se", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color.fromARGB(255, 58, 125, 68),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              },
              child: Text("Entrar", style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color.fromARGB(255, 58, 125, 68),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);


  }
}