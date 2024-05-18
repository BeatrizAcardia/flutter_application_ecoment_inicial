// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text(
                      "Ideias de reutilização",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 38,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(255, 122, 193, 67),
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
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
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.lightbulb_circle_outlined, color: Colors.black),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.person_2_outlined, color: Colors.black),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {},
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
