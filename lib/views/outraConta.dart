// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContaUsuario extends StatefulWidget {
  const ContaUsuario({super.key});

  @override
  State<ContaUsuario> createState() => _ContaUsuarioState();
}

class _ContaUsuarioState extends State<ContaUsuario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 113, 39),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 59, 113, 39),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_sharp,
                        size: 100,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome do Usuário",
                            style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Nome do usuario",
                            style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "Gosto de fazer coisas daoras e ajudar o meio ambiente yeah ;p",
                            style: TextStyle(
                              fontFamily: 'Circe',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Seguidores: 0",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Circe',
                          ),
                        ),
                      ),
                      SizedBox(width: 20), 
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Seguindo: 0",
                          style: TextStyle(
                            fontFamily: 'Circe',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Curtidas: 0",
                          style: TextStyle(
                            fontFamily: 'Circe',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Reputação: ", style: TextStyle(color: Colors.white, fontFamily: 'Circe', fontWeight: FontWeight.bold),), 
                      Icon(Icons.star, color: Colors.yellow), 
                      Icon(Icons.star, color: Colors.yellow,), 
                      Icon(Icons.star, color: Colors.yellow,), 
                      Icon(Icons.star), 
                      Icon(Icons.star)
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Seguir",
                          style: TextStyle(color: Colors.white, fontFamily: 'Circe', fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 59, 83, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/imgs/ondaVerdeconta.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}