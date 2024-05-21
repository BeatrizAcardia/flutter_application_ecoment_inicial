// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/models/team.dart';

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle sn = TextStyle(
    fontSize: 32,
    color: Color.fromARGB(255, 5, 68, 15),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700
  );
  TextStyle tx = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
  TextStyle nome = TextStyle(
    fontSize: 30,
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
  TextStyle tx1 = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  TextStyle func = TextStyle(
    fontSize: 20,
    color: Colors.redAccent,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
  String text = "Nosso site é dedicado à reutilização de materiais recicláveis e reciclagem, visando transformar o mundo com criatividade e sustentabilidade. Surgiu da percepção do potencial da reutilização durante uma aula, e agora é uma plataforma colaborativa. Oferecemos tutoriais para transformar materiais recicláveis, artigos sobre os benefícios da reciclagem e incentivamos a comunidade a compartilhar ideias. Junte-se a nós nessa jornada para criar um mundo mais sustentável, onde cada ação conta!";
  String nomeL = "LORENA SILVA";
  String imgL = "assets/imgs/Enzo.jpg";
  String funcaoL = "Desenvolvedora Front-End e Designer";
  String textaoLorena = "      Lorena Silva, natural de Limeira, interior de São Paulo, é uma entusiasta da tecnologia e busca se tornar uma desenvolvedora full-stack para criar soluções inovadoras. Seu sonho não se limita à programação; ela também almeja viver no Canadá, atraída pela qualidade de vida e oportunidades. Determinada e apaixonada por experiências únicas, Lorena está pronta para enfrentar desafios e transformar seus sonhos em realidade.";

  List<Team> listaNos = [
    Team("Lorena Ferreira Silva", "Desenvolvedora Front-End e Designer", "Lorena Silva, natural de Limeira, interior de São Paulo, é uma entusiasta da tecnologia e busca se tornar uma desenvolvedora full-stack para criar soluções inovadoras. Seu sonho não se limita à programação; ela também almeja viver no Canadá, atraída pela qualidade de vida e oportunidades. Determinada e apaixonada por experiências únicas, Lorena está pronta para enfrentar desafios e transformar seus sonhos em realidade."),
    Team("Enzo Olivato Pazian", "funcao", "textao"),
    Team("Beatriz A. Cardia", "funcao", "textao"),
    Team("Vitor H.S. Nascimento", "funcao", "textao"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("O PROJETO ECOMOMENT", style: sn,),
                        SizedBox(height: 20,),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Container(
                                  width: 50,
                                )
                              ),
                              TextSpan(
                                text: text,
                                style: tx1
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("SOBRE NÓS", style: sn),
                        SizedBox(height: 20,),
                        GerarCardD(nomeL, imgL, funcaoL, textaoLorena),
                        SizedBox(height: 20,),
                        GerarLayout()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container GerarLayout(){
    return Container(
  width: 450,
  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 171, 170, 170)
      )
    ]
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 500, child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/imgs/Enzo.jpg", fit: BoxFit.cover,),
      ),),
      Text("Lorena Ferreira Silva", style: nome,),
      Text(funcaoL, style: func,),
      SizedBox(height: 10,),
      Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(textaoLorena, style: tx1, textAlign: TextAlign.justify,),
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: SizedBox(height: 30, child: Image.asset("assets/imgs/001-instagram.png", color: Colors.white,),),
            onTap: () {
              
            },
          ),
        ),
        SizedBox(width: 20,),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: SizedBox(height: 30, child: Image.asset("assets/imgs/logotipo-do-github.png", color: Colors.white,),),
            onTap: () {
              
            },
          ),
        ),
        SizedBox(width: 20,),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: SizedBox(height: 30, child: Image.asset("assets/imgs/logotipo-do-linkedin.png", color: Colors.white,),),
            onTap: () {
              
            },
          ),
        )
        ],
      )
    ],
  ),
);

  }

  Container GerarCardD(String nome, String imgUrl, String funcao, String textao,){
    return Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: Column(
                children: [
                  Text(nome,style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 100, child: ClipOval(child: Image.asset(imgUrl, fit: BoxFit.cover,),),),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: SizedBox(height: 30, child: Image.asset("assets/imgs/001-instagram.png"),),
                          onTap: () {
                            
                          },
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: SizedBox(height: 30, child: Image.asset("assets/imgs/logotipo-do-github.png"),),
                          onTap: () {
                            
                          },
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: SizedBox(height: 30, child: Image.asset("assets/imgs/logotipo-do-linkedin.png"),),
                          onTap: () {
                            
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 148, 182, 75),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 58, 125, 68),
                      offset: Offset(6, 6)
                    )
                  ]
                ),
                child: Column(
                children: [
                  Text(funcao, style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(textao, textAlign: TextAlign.justify,),
                ],
              ),
              )
            ],
          ),
          );
  }
}