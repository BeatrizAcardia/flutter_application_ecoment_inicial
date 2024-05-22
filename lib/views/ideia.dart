// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_final_fields, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';

class PageIdeia extends StatefulWidget {
  String titulo = "";
  String autor = "";
  String desc = "";
  String img = "";
  List<String> listaMateriais = [];
  String passoPasso = "";
  int avaliacao = 0;
  Color dificuldade = Colors.transparent;


  PageIdeia(this.titulo, this.desc, this.img, this.dificuldade, this.passoPasso,
  this.avaliacao, this.autor, this.listaMateriais, {super.key});

  @override
  State<PageIdeia> createState() => _IdeiaState();
}

class _IdeiaState extends State<PageIdeia> {

  TextStyle titulo = TextStyle(
    fontSize: 29,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  TextStyle autor = TextStyle(
    fontSize: 17,
    color: Colors.black,
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      drawer: AppDrawer(),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
              child: Center(child:Column(
                children: [
                  Text(widget.titulo, style: titulo, textAlign: TextAlign.center,),
                  SizedBox(height: 10,),
                  Text("Feito por: @"+widget.autor, style: autor),
                  SizedBox(height: 10,),
                  SizedBox(child:Image.asset(widget.img, fit: BoxFit.cover, width: 400, height: 400,)),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ...gerarEstrelaColorida(widget.avaliacao),
                            ...gerarEstrelaNColorida(5-widget.avaliacao)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle, color: widget.dificuldade,size: 30,),
                          Text("Dificil")
                        ],
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Row(
                        children: [
                          Icon(Icons.favorite_border, color: Colors.redAccent, size: 30,),
                          Text("Amei")
                        ],
                      ),
                      onTap: () {
                        
                      },
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Row(
                        children: [
                          Icon(Icons.share, size: 30,),
                        ],
                      ),
                      onTap: () {
                        
                      },
                        ),
                      ),
                    ],
                  ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Avaliações: 5"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_box_outline_blank),
                        SizedBox(width: 10,),
                        Text("Materiais", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        ...materiais()
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.temple_buddhist_sharp),
                        SizedBox(width: 10,),
                        Text("Passo a Passo", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Text(widget.passoPasso),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.chat_bubble),
                        SizedBox(width: 10,),
                        Text("Comentários", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),
                  
                ],
              ),
            ),
          )
          ),
          WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
        ],
      ),
    );
  }

    List<Widget> gerarEstrelaColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star, color: Colors.orange, size: 30,));
    }
    return avaliacao;
  }
  List<Widget> gerarEstrelaNColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star_border, color: Colors.orange, size: 30,));
    }
    return avaliacao;
  }

  List<Widget> materiais(){
    List<Widget> lista = [];
    widget.listaMateriais.forEach((String m) {
      lista.add(Text("- "+m));
    });
    return lista;
  }
}