// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';
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
    fontFamily: 'Circe'
  );
  
  TextStyle label2 = TextStyle(
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 20,
    fontFamily: 'Nunito'
  );
  
  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );
  
  double tamanhoContainterCinza = 500;
  


  List<Ideia> listaIdeias = [
    Ideia("Apanhador de frutas com cano PVC e garrada PET", "assets/imgs/ideia1.jpg", Colors.red, 5, "bagulho foda", "1 passo, 2 passo", "carlinhos1", ['material 1','material 2']),
    Ideia("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 4, "bagulho foda", "1 passo, 2 passo", "carlinhos2", ['material 1','material 2']),
    Ideia("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow, 3, "bagulho foda", "1 passo, 2 passo", "carlinhos3", ['material 1','material 2']),
    Ideia("titulo4", "assets/imgs/ideia2.jpg", Colors.green, 1, "bagulho foda", "1 passo, 2 passo", "carlinhos4", ['material 1','material 2']),
    Ideia("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 2, "bagulho foda", "1 passo, 2 passo", "carlinhos5", ['material 1','material 2']),
  ];
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),

      drawer: WidgetDrawer(),

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
                    Text("Sua Conta", textAlign: TextAlign.center, style: TextStyle(
                      color: const Color.fromARGB(255, 46, 46, 46),
                      fontSize: 38,
                      fontFamily: 'Circe',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 255,195,15), 
                          offset: Offset(3, 3),
                        )
                      ],
                    ),),
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
                          fontFamily: 'Circe',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    listaIdeias.isNotEmpty ?
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child:
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 250
                    ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index) {
                        return gerarCard(listaIdeias[index].getTitulo, listaIdeias[index].getImg, listaIdeias[index].getDificuldade, listaIdeias[index].getAvaliacao, listaIdeias[index].getDesc, listaIdeias[index].getPassoPasso, listaIdeias[index].getAutor, listaIdeias[index].getMateriais);
                      },
                      )
                      )
                      : Center(child: Text("Sem posts no momento. Que tal postar alguma coisa?", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),)
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

  Widget gerarCard (String titulo, String imgUrl, Color dificuldade, int avaliacao, String desc, String passoPasso, String autor, List<String> listaMat){
    return MouseRegion(
      child: GestureDetector(
        child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 217, 217, 217)
      ),
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
