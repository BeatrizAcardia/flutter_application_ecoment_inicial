// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SemLoginConta extends StatefulWidget {
  const SemLoginConta({super.key});

  @override
  State<SemLoginConta> createState() => _SemLoginContaState();
}

class _SemLoginContaState extends State<SemLoginConta> {
  final lapis = SizedBox(child: Image.asset('assets/imgs/lapisSemLogin.png'));
  final lampada = SizedBox(child: Image.asset('assets/imgs/lampadaSemLogin.png'));
  final iconLampada = SizedBox(
    child: Image.asset('assets/imgs/ideiaIconVerde.png'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 113, 39),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 59, 113, 39),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Parece que você ainda não esta logado",
                            style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Já tem uma conta?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Circe',
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Ainda não?",
                          style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("faça login",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Circe',
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 83, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Cadastre-se",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Circe',
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 103, 159, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Minhas ideias",
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Circe',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  lapis,
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Você ainda não publicou uma ideia.",
                    style: TextStyle(
                        fontFamily: 'Circe',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("publique uma ideia e ela aparecerá aqui."),
                  SizedBox(
                    height: 60,
                  ),
                  
                  Text(
                    "Favoritos",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 58,125,68),
                      fontSize: 35,
                      fontFamily: 'Circe',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  lampada,
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Você ainda não publicou uma ideia favorita.",
                    style: TextStyle(
                        fontFamily: 'Circe',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Suas futuras ideias favoritas aparecerão aqui.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
