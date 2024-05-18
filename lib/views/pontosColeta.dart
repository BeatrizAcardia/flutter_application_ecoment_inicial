// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, file_names, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:br_validators/br_validators.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/models/Endereco.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasGerais.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';

class PontosColeta extends StatefulWidget {
  const PontosColeta({super.key});

  @override
  State<PontosColeta> createState() => _PontosColetaState();
}

class _PontosColetaState extends State<PontosColeta> {
  List<Endereco> listaEnd = [
    Endereco("Ecoponto - Marginal Tatu", "R. Antônio Lucato, 1883-1931 - Vila Camargo, Limeira - SP"),
    Endereco("Nossa Senhora das Dores", "Rua: Elisa W. Henrique, Nª Sª das Dores"),
    Endereco("Lagoa Nova", "Av. Dr. Antônio de Luna, Jd. Lagoa Nova"),
  ];

  final imgMapa = SizedBox(width: 450,child: Image.asset("assets/imgs/Mapa.png"),);
  final cepLabel = Text("Digite seu CEP", style: TextStyle(
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 30,
    ),);
  String nome = "EcoPonto - Marginal Tatu";
  String endereco = "R. Antônio Lucato, 1883-1931 - Vila Camargo, Limeira - SP";
  TextStyle title = TextStyle(
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 30,
    fontWeight: FontWeight.bold
  );
  TextStyle enderecoLabel = TextStyle(
    color: const Color.fromARGB(255, 46, 46, 46),
    fontSize: 25,
  );
  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Pontos de coleta",
          style: TextStyle(
            color: const Color.fromARGB(255, 46, 46, 46),
            fontSize: 38,
            shadows: [
              Shadow(
                color: const Color.fromARGB(255, 114, 160, 193),
                offset: Offset(2, 2),
              )
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Menu",textAlign: TextAlign.center, style: TextStyle(
              fontSize: 24,
              color: Colors.white
            ),)),
            ListTile(
              leading: Icon(Icons.person_2_outlined, color: Colors.black,),
              title: Text("Perfil"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: Colors.black,),
              title: Text("Início"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Myinicial(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.pin_drop_outlined, color: Colors.black,),
              title: Text("Pontos de coleta"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
              },
            ),
          ],
        ),
      ),

      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Center(
              child: Column(children: [
              imgMapa,
              SizedBox(height: 20,),
              cepLabel,
              SizedBox(height: 20,),
              Form(
                key: key,
                child: Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(children: [
                    TextFormField(
                    controller: cepController,
                    decoration: InputDecoration(
                      suffixIcon: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                        child: Icon(Icons.search, color: const Color.fromARGB(255, 85, 85, 85),),
                        onTap: () {
                          if(key.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Sucesso!"))
                            );
                            setState(() {
                              
                            });
                          }
                        },
                      ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      fillColor: const Color.fromARGB(255, 217, 217, 217),
                      filled: true
                    ),
                    validator: (value) {
                      if(cepController.text.trim() == ""){
                        return "Preencha o CEP";
                      }else if(BRValidators.validateCEP(cepController.text) == false){
                        return "Digite um CEP válido";
                      }
                      return null;
                    },
                  ),
                  ],)
                )
              ),
              SizedBox(height: 20,),

              ...gerarLocais(1)

            ],),
            )
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80),
              height: 75,
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 143, 142, 142),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.pin_drop_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PontosColeta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.lightbulb_circle_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ideiasGerais(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person_2_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(),));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> gerarLocais(int n){
    List<Widget> locais = [];
    for(int i = 0; i < n; i++){
      listaEnd.forEach((Endereco e) { 
        locais.add(Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(e.getTitulo, style: title,),
                  Text(e.getEndereco, style: enderecoLabel,)
                ],)
              )),);
      });
    }return locais;
  }

}