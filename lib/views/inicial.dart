// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, override_on_non_overriding_member, annotate_overrides, prefer_final_fields, unnecessary_import, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/materias.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

class Myinicial extends StatefulWidget {
  const Myinicial({super.key});

  @override
  State<Myinicial> createState() => _MyinicialState();
}

class _MyinicialState extends State<Myinicial> {
  @override

    TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

  final onda = SizedBox(
    child: Image.asset('assets/imgs/ondaDebaixoLanding.png'),
  );

  List<Ideia> listaIdeias = [
    Ideia("Apanhador de frutas com cano PVC e garrada PET", "assets/imgs/ideia1.jpg", Colors.red, 5, "bagulho foda", "1 passo, 2 passo", "carlinhos1", ['material 1','material 2']),
    Ideia("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 4, "bagulho foda", "1 passo, 2 passo", "carlinhos2", ['material 1','material 2']),
    Ideia("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow, 3, "bagulho foda", "1 passo, 2 passo", "carlinhos3", ['material 1','material 2']),
    Ideia("titulo4", "assets/imgs/ideia2.jpg", Colors.green, 1, "bagulho foda", "1 passo, 2 passo", "carlinhos4", ['material 1','material 2']),
    Ideia("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 2, "bagulho foda", "1 passo, 2 passo", "carlinhos5", ['material 1','material 2']),
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final metal = SizedBox(
        height: 100, width: 100, child: Image.asset('assets/imgs/metal.png'));
    final organico = SizedBox(
        height: 100,
        width: 100,
        child: Image.asset('assets/imgs/organico.png'));
    final papel = SizedBox(
        height: 100, width: 100, child: Image.asset('assets/imgs/papel.png'));
    final plastico = SizedBox(
        height: 100,
        width: 100,
        child: Image.asset('assets/imgs/plastico.png'));
    final vidro = SizedBox(
        height: 100, width: 100, child: Image.asset('assets/imgs/vidro.png'));


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
      drawer: WidgetDrawer(),

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

          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final ideia = listaIdeias[index % listaIdeias.length];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: gerarCard(ideia.getTitulo, ideia.getImg, ideia.getDificuldade, ideia.getAvaliacao, ideia.getDesc, ideia.getPassoPasso, ideia.getAutor, ideia.getMateriais),
                );
              },
            ), 
          ),
          SizedBox(height: 30,),
          Container(
            height: 300,
            child: Column(
              children: [
                Text(
                  "PRINCIPAIS MATERIAIS",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Column(
                      children: [
                        plastico,
                      Text("Plástico", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar("icone", "Plástico", Colors.red, "descricao"),));
                    },
                      )
                    ),

                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Column(children: [
                      vidro,
                      Text("Vidro", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                    ],),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar("icone", "Vidro", Colors.red, "descricao"),));
                    },
                      )
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Column(children: [
                        metal,
                        Text("Metal", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                        ],),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar("icone", "Metal", Colors.red, "descricao"),));
                        },
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Column(children: [
                        papel,
                        Text("Papel", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                    ],),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar("icone", "Papel", Colors.red, "descricao"),));
                    },
                      )
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Column(children: [
                        organico,
                        Text("Orgânicos", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                      ],),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar("assets/imgs/iconePlastico.png", "Orgânicos", Colors.red, "descricao"),));
                      },
                      ),
                    )
                    
                   
                   
                   
                   
                  ],
                )
              ],
            ),
          )
        ],
      )
      ),
        WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
      ],)
    );
  }

    Widget gerarCard (String titulo, String imgUrl, Color dificuldade, int avaliacao, String desc, String passoPasso, String autor, List<String> listaMat){
    return MouseRegion(
      child: GestureDetector(
        child: Container(
          width: 200,
      padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200,
                child: ClipRRect(borderRadius: BorderRadius.circular(10) ,child: Image.asset("$imgUrl", height: 130, fit: BoxFit.cover,),),
                ),
                Text(titulo, style: ideaTitle, textAlign: TextAlign.center,),
                SizedBox(height: 5,),
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
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PageIdeia(titulo, desc, imgUrl, dificuldade, passoPasso, avaliacao, autor, listaMat)));
        },
      )
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