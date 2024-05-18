// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, unnecessary_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

class ideiasGerais extends StatefulWidget {
  const ideiasGerais({super.key});

  @override
  State<ideiasGerais> createState() => _ideiasGeraisState();
}

class _ideiasGeraisState extends State<ideiasGerais> {
  SizedBox img = SizedBox(
    width: 200,
    child: Image.asset("assets/imgs/03bd77be1744bc5876a3b6d0eaa03c22.jpg"),
  );

  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Ideias de reutilização",
          style: TextStyle(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontSize: 38,
            shadows: [
              Shadow(
                color: const Color.fromARGB(255, 122, 193, 67),
                offset: Offset(1, 1),
              )
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
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
backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    ...gerarRowCards(6),
                  ],
                ),
              ),
            ),
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
        ],
      ),
    );
  }

  List<Widget> gerarRowCards(int n) {
    List<Widget> cards = [];
    for (int i = 0; i < n; i++) {
      cards.add(
        //COMEÇO DA ROW DE 2 CARDS
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PRIMEIRO CARD
              Container(
                width: 200,
                child: Column(
                  children: [
                    img,
                    SizedBox(height: 5),
                    Text("Titulo da ideia", style: ideaTitle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star_outline),
                            Icon(Icons.star_outline),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ESPAÇAMENTO ENTRE O PRIMEIRO E O SEGUNDO CARD
              SizedBox(width: 20),
              // SEGUNDO CARD
              Container(
                width: 200,
                child: Column(
                  children: [
                    img,
                    SizedBox(height: 5),
                    Text("Titulo da ideia", style: ideaTitle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star, color: Colors.orange),
                            Icon(Icons.star_outline),
                            Icon(Icons.star_outline),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.yellow),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // FIM DA ROW DE 2 CARDS
        ),
      );
    }
    return cards;
  }
}
