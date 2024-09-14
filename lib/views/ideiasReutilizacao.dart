// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';

class IdeiasReutilizacao extends StatefulWidget {
  const IdeiasReutilizacao({super.key});

  @override
  State<IdeiasReutilizacao> createState() => _IdeiasReutilizacaoState();
}

class _IdeiasReutilizacaoState extends State<IdeiasReutilizacao> {
  List<Ideia> listaIdeias = [
    Ideia("Apanhador de frutas com cano PVC e garrada PET", "assets/imgs/ideia1.jpg", Colors.red, 5, "bagulho foda", "1 passo, 2 passo", "carlinhos1", ['material 1','material 2']),
    Ideia("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 4, "bagulho foda", "1 passo, 2 passo", "carlinhos2", ['material 1','material 2']),
    Ideia("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow, 3, "bagulho foda", "1 passo, 2 passo", "carlinhos3", ['material 1','material 2']),
    Ideia("titulo4", "assets/imgs/ideia2.jpg", Colors.green, 1, "bagulho foda", "1 passo, 2 passo", "carlinhos4", ['material 1','material 2']),
    Ideia("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 2, "bagulho foda", "1 passo, 2 passo", "carlinhos5", ['material 1','material 2']),
  ];
  
  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );
  

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
                    Text("Ideias de reutilização", textAlign: TextAlign.center, style: TextStyle(
                      color: const Color.fromARGB(255, 46, 46, 46),
                      fontSize: 35,
                      fontFamily: 'Circe',
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 255,195,15), 
                          offset: Offset(3, 3),
                        )
                      ],
                    ),),
                    SizedBox(height: 20),
                    listaIdeias.isNotEmpty ?
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child:
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 17,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.60,
                    ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index) {
                        final ideia = listaIdeias[index];
                        return gerarCard(ideia);
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

    Widget gerarCard (Ideia ideia){
    return IntrinsicHeight(
      child: MouseRegion(
        child: GestureDetector(
          child: Container(
          padding: EdgeInsets.all(5),
          width: 500, // Espaçamento fora do card
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo do card
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Define o border radius na imagem
                  child: Image.asset(
                    ideia.img,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 220,
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '@${ideia.autor}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: ideia.dificuldade,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    ideia.titulo,
                    maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("200", style: TextStyle( fontSize: 15),),
                    Icon(Icons.favorite, color: Colors.redAccent,)
                  ],
                )
      
                // Adicione mais informações da ideia aqui
              ],
            ),
          ),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageIdeia(ideia.titulo, ideia.desc, ideia.img, ideia.dificuldade, ideia.passoPasso, ideia.avaliacao, ideia.autor, ideia.materiais)));
          },
        )
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