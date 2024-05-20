// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, file_names, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, unnecessary_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:br_validators/br_validators.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
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
      appBar: WidgetAppBar("Pontos de coleta", 114,160,193), 

      drawer: AppDrawer(),
backgroundColor: const Color.fromARGB(255, 224, 224, 224),
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
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height - 300,
                child: listaEnd.isNotEmpty ? 
                Column(children: [
                  ...gerarLocais(1)
                ],): Text("Sem pontos de coleta no momento. Volte mais tarde", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
              )
            ],),
            )
          ),
        ),
        WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
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