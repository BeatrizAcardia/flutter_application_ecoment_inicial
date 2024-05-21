// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';

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
    fontSize: 25,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  String text = "Nosso site é dedicado à reutilização de materiais recicláveis e reciclagem, visando transformar o mundo com criatividade e sustentabilidade. Surgiu da percepção do potencial da reutilização durante uma aula, e agora é uma plataforma colaborativa. Oferecemos tutoriais para transformar materiais recicláveis, artigos sobre os benefícios da reciclagem e incentivamos a comunidade a compartilhar ideias. Junte-se a nós nessa jornada para criar um mundo mais sustentável, onde cada ação conta!";
  String nomeL = "LORENA SILVA";
  String imgL = "assets/imgs/Enzo.jpg";
  String funcaoL = "Desenvolvedora Front-End e Designer";
  String textaoLorena = "      Lorena Silva, natural de Limeira, interior de São Paulo, é uma entusiasta da tecnologia e busca se tornar uma desenvolvedora full-stack para criar soluções inovadoras. Seu sonho não se limita à programação; ela também almeja viver no Canadá, atraída pela qualidade de vida e oportunidades. Determinada e apaixonada por experiências únicas, Lorena está pronta para enfrentar desafios e transformar seus sonhos em realidade.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                style: tx
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("SOBRE NÓS", style: sn),
                        SizedBox(height: 20,),
                        GerarCardD(nomeL, imgL, funcaoL, textaoLorena)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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