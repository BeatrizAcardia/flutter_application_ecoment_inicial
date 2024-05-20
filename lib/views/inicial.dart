// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, override_on_non_overriding_member, annotate_overrides, prefer_final_fields, unnecessary_import, sized_box_for_whitespace, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasGerais.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';

class Myinicial extends StatefulWidget {
  const Myinicial({super.key});

  @override
  State<Myinicial> createState() => _MyinicialState();
}

class _MyinicialState extends State<Myinicial> {

    TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final onda = SizedBox(
      child: Image.asset('assets/imgs/ondaDebaixoLanding.png'),
    );

    

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

  List<Ideia> listaIdeias = [
    Ideia.ti("titulo1", "assets/imgs/ideia1.jpg", Colors.red),
    Ideia.ti("titulo2", "assets/imgs/ideia2.jpg", Colors.green),
    Ideia.ti("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow),
    Ideia.ti("titulo4", "assets/imgs/ideia2.jpg", Colors.green),
    Ideia.ti("titulo5", "assets/imgs/ideia2.jpg", Colors.red),
    Ideia.ti("titulo6", "assets/imgs/ideia2.jpg", Colors.green),
  ];

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
        drawer: AppDrawer(),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                DecoratedBox(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 78, 158, 90)),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Text(
                              "Reciclar e reutilizar, não deixe o momento passar!",
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
                 "PRINCIPAIS IDEIAS",
                 style: TextStyle(
                 fontFamily: 'Nunito',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold),
                ),

                //carrossel aqui quando eu conseguir !!
       Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200, //tamanho dos containers
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
              child: Wrap(
                spacing: 22.0, // Espaçamento horizontal entre os itens
                children: listaIdeias.map((ideia) {
                  return gerarCard(ideia.getTitulo, ideia.getImg, ideia.getDificuldade);
                }).toList(),
              ),
            ),
          ),
          ],
        ),
      ),


        SizedBox(height: 30,),

        Container(
          height: 300,
          child: Column(children: [
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
                    Column(
                     children: [
                      plastico,
                      Text("Plástico", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                     ]  
                    ),

                    Column(children: [
                      vidro,
                      Text("Vidro", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                    ],),
                   
                   Column(children: [
                    metal,
                    Text("Metal", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                   ],),

                   Column(children: [
                    papel,
                    Text("Papel", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                   ],),

                   Column(children: [
                    organico,
                    Text("Orgânicos", style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold, color: Colors.black))
                   ],)
                   ],
                )
          ],),
        )
              ],
            )),
            WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
          ],
        ));
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
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      
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