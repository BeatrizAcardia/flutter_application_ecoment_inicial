// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasGerais.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

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
  


  List<Ideia> listaIdeias = [
    Ideia.ti("titulo1", "assets/imgs/ideia1.jpg", Colors.red),
    Ideia.ti("titulo2", "assets/imgs/ideia2.jpg", Colors.green),
    Ideia.ti("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow),
    Ideia.ti("titulo4", "assets/imgs/ideia2.jpg", Colors.green),
    Ideia.ti("titulo5", "assets/imgs/ideia2.jpg", Colors.red),
  ];
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: WidgetAppBar("Sua conta", 255,195,15), 

      drawer: AppDrawer(),

      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: Stack(
        fit: StackFit.expand,
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
                    listaIdeias.isNotEmpty ?
                  Container(
                    padding: EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height,
                    child:
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 22,
                      mainAxisSpacing: 25
                      
                    ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index) {
                        return gerarCard(listaIdeias[index].getTitulo, listaIdeias[index].getImg, listaIdeias[index].getDificuldade);
                      },)
                      )
                      : Center(child: Text("Sem ideias no momento. Volte mais tarde", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),)
                  ],
                ),
              ),
            ),
          ),
          WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
        ],
      ),
    );
  }

  Container gerarCard (String titulo, String imgUrl, Color dificuldade){
    return Container(
          width: 200,
          child: Column(
            children: [
              MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Column(children: [
                SizedBox(
                width: 200,
                child: Image.asset("$imgUrl",height: 150, fit: BoxFit.cover,),
                ),
              SizedBox(height: 5),
              Text(titulo, style: ideaTitle),
                ],),
                onTap: () {
                  
                },
              )
              ),
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
                      Icon(Icons.circle, color: dificuldade),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
