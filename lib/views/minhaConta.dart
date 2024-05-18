// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MinhaConta extends StatefulWidget {
  const MinhaConta({super.key});

  @override
  State<MinhaConta> createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  TextStyle label1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 20,
  );
  
  TextStyle label2 = TextStyle(
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 20,
  );
  
  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  
  double tamanhoContainterCinza = 500;
  
  SizedBox img = SizedBox(
    width: 200,
    child: Image.asset("assets/imgs/03bd77be1744bc5876a3b6d0eaa03c22.jpg"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit))
        ],
        title: Text(
          "Sua conta",
          style: TextStyle(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontSize: 38,
            shadows: [
              Shadow(
                color: const Color.fromARGB(255, 255, 195, 15),
                offset: Offset(1, 1),
              )
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      ),
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/imgs/do-utilizador.png"),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                      width: tamanhoContainterCinza,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Nome de usuário:",
                        style: label1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 500,
                        child: Text(
                          "VHSNWLF",
                          style: label2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: tamanhoContainterCinza,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Nome exibido:",
                        style: label1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 500,
                        child: Text(
                          "Vitor H.",
                          style: label2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: tamanhoContainterCinza,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Email:",
                        style: label1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 500,
                        child: Text(
                          "cl202247@g.unicamp.br",
                          style: label2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: tamanhoContainterCinza,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Senha:",
                        style: label1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: SizedBox(
                        width: 500,
                        child: Text(
                          "******",
                          style: label2,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Seus posts",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...gerarRowCards(3),
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
