// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, override_on_non_overriding_member

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasGerais.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

class Myinicial extends StatefulWidget {
  const Myinicial({super.key});

  @override
  State<Myinicial> createState() => _MyinicialState();
}

class _MyinicialState extends State<Myinicial> {
  @override
  final onda = SizedBox(
    child: Image.asset('assets/imgs/ondaDebaixoLanding.png'),
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 158, 90),
        leading: Image.asset(
          'assets/imgs/logo.png',
          height: 350,
          width: 350,
        ),
      ),
      drawer: Drawer(
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
          ],
        ),
      ),

      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
        SingleChildScrollView(
          child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Color.fromARGB(255, 78, 158, 90)),
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Text("Reciclar e reutilizar, não deixe o momento passar!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Text(
                      "Aqui as suas ideias são salvadoras.",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 72, 82),
                      ),
                      child: Text("Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Nunito',
                              fontSize: 15)),
                    )
                  ],
                )),
          ),
          onda,
          
          Text(
            "Principais Ideias",
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          
        ],
      )
      ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80),
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
                        icon: Icon(Icons.pin_drop_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.lightbulb_circle_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ideiasGerais(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person_2_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],)
    );
  }
}
