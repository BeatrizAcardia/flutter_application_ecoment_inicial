// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, sized_box_for_whitespace, non_constant_identifier_names, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    color: Colors.black,
  );
  TextStyle nome = TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
  TextStyle tx1 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600
  );
  TextStyle func = TextStyle(
    fontSize: 20,
    color: Colors.redAccent,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
  String text = "Nosso site é dedicado à reutilização de materiais recicláveis e reciclagem, visando transformar o mundo com criatividade e sustentabilidade. Surgiu da percepção do potencial da reutilização durante uma aula, e agora é uma plataforma colaborativa. Oferecemos tutoriais para transformar materiais recicláveis, artigos sobre os benefícios da reciclagem e incentivamos a comunidade a compartilhar ideias. Junte-se a nós nessa jornada para criar um mundo mais sustentável, onde cada ação conta!";
  
  List<Team> listaNos = [
    Team("Lorena Ferreira Silva", "Desenvolvedora Front-End e Designer", "Lorena Silva, natural de Limeira, interior de São Paulo, é uma entusiasta da tecnologia e busca se tornar uma desenvolvedora full-stack para criar soluções inovadoras. Seu sonho não se limita à programação; ela também almeja viver no Canadá, atraída pela qualidade de vida e oportunidades. Determinada e apaixonada por experiências únicas, Lorena está pronta para enfrentar desafios e transformar seus sonhos em realidade.", "assets/imgs/Enzo.jpg"),
    Team("Enzo Olivato Pazian", "Desenvolvedor Back-Ending e Database Administrator", "      Olá! Meu nome é Enzo e sou baseado na cidade de Americana, em São Paulo. Desde muito cedo, desenvolvi um profundo interesse pela tecnologia e sua capacidade de transformar o mundo ao nosso redor. Sonho em utilizar minha paixão pela tecnologia para fazer a diferença, contribuindo para criar um impacto positivo na sociedade e na vida das pessoas.Busco constantemente a felicidade em tudo o que faço. Acredito que a vida é uma jornada para ser vivida com entusiasmo, gratidão e em busca do bem-estar pessoal e coletivo. Procuro encontrar alegria nas pequenas coisas e cultivar relacionamentos significativos com as pessoas ao meu redor.Em resumo, sou um indivíduo apaixonado pela tecnologia, pelo desenho e pela busca da felicidade. Estou determinado a utilizar minhas habilidades e paixões para deixar minha marca no mundo e fazer a diferença, sempre com um sorriso no rosto e o coração cheio de esperança.", "assets/imgs/Enzo.jpg"),
    Team("Beatriz A. Cardia", "Desenvolvedora Front-End e Designer", "   Oi eu sou a Bia, nascida em Americana, São Paulo. Desde a infância, me encantei pelo universo da tecnologia, mas sempre nutri um grande sonho: tornar-me professora na educação infantil. Tenho uma forte convicção de que educar e inspirar as mentes jovens é uma das vocações mais nobres que alguém pode ter.Além da minha paixão pela educação, tenho uma afinidade especial com as artes. Adoro desenhar e tenho habilidades manuais que me permitem criar diferentes projetos criativos. A arte é uma forma de expressão que me permite transmitir emoções e contar histórias de maneira única.Em resumo, sou uma pessoa apaixonada pela educação, pela arte e pela aventura. Estou determinada a seguir meu sonho de ser professora na educação infantil, enquanto nutro minha criatividade através do desenho e realizo meu desejo de explorar o mundo. Estou ansiosa para ver onde essa jornada me levará.", "assets/imgs/bea.jpg"),
    Team("Vitor H.S. Nascimento", "Desenvolvedor Back-Ending e Database Administrator ", "   Olá! Me chamo Vitor H.S. Nascimento nasci na cidade de Limeira, e tenho como objetivo me especializar na área de Tecnologia da Informação, com foco especialmente no desenvolvimento de sistemas back-end. Além disso, tenho um grande interesse em explorar o mundo através de viagens. Acredito que combinar minha especialização em TI com a oportunidade de viajar seria uma experiência enriquecedora, permitindo-me conhecer diferentes culturas e expandir minha visão profissional. Estou determinado a alcançar esses objetivos e estou aberto a oportunidades que me permitam crescer tanto profissional quanto pessoalmente. Agradeço por visitar nossa página e estou aberto para conexões e colaborações.", "assets/imgs/Vitor.jpg"),
  ];

  PageController _controlador = PageController();

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
                                style: tx
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("SOBRE NÓS", style: sn),
                        SizedBox(height: 20,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 816, //tamanho dos containers
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final team = listaNos[index % listaNos.length];
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: GerarLayout(team.getImgUrl, team.getNome, team.getFuncao, team.getTextao)
                                );
                              },
                            ),
                        ),
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

  Container GerarLayout(String imgUrl, String name, String funcao, String textaoo){
    return Container(
  width: 450,
  height: MediaQuery.of(context).size.height,
  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 84, 84, 84),
        offset: Offset(5, 8),
        blurRadius: 3,
      )
    ]
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 200, width: 200, child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(imgUrl, fit: BoxFit.cover,),
      ),),
      Text(name, style: nome,),
      Text(funcao, style: func, textAlign: TextAlign.center,),
      SizedBox(height: 10,),
      Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(textaoo, style: tx1, textAlign: TextAlign.justify,),
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