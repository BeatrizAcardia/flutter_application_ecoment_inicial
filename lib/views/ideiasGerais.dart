// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace, unnecessary_import, prefer_final_fields, unused_import, unused_local_variable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

class ideiasGerais extends StatefulWidget {
  const ideiasGerais({super.key});

  @override
  State<ideiasGerais> createState() => _ideiasGeraisState();
}

class _ideiasGeraisState extends State<ideiasGerais> {

  List<Ideia> listaIdeias = [
    Ideia.ti("titulo1", "assets/imgs/ideia1.jpg", Colors.red, 3),
    Ideia.ti("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 3),
    Ideia.ti("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow, 3),
    Ideia.ti("titulo4", "assets/imgs/ideia2.jpg", Colors.green, 3),
    Ideia.ti("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 3),
  ];

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

      appBar: WidgetAppBar("Ideias de reutilização", 122, 193, 67),
      drawer: AppDrawer(),
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
                  children: [ listaIdeias.isNotEmpty ?
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
                        return gerarCard(listaIdeias[index].getTitulo, listaIdeias[index].getImg, listaIdeias[index].getDificuldade, listaIdeias[index].getAvaliacao);
                      },)
                      )
                      : Center(child: Text("Sem ideias no momento. Volte mais tarde", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),)
                  ],
                ),
              ),
            ),
          ),
        WidgetBottomAppBar(scaffoldKey: _scaffoldKey),
        ],
      ),
    );
  }

  Container gerarCard (String titulo, String imgUrl, Color dificuldade, int avaliacao){
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
                child: Image.asset("$imgUrl",height: 149, fit: BoxFit.cover,),
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
                      ...gerarEstrelaColorida(avaliacao),
                      ...gerarEstrelaNColorida(5-avaliacao)
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

  List<Widget> gerarEstrelaColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star, color: Colors.orange));
    }
    return avaliacao;
  }
  List<Widget> gerarEstrelaNColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star_border, color: Colors.orange));
    }
    return avaliacao;
  }

}
