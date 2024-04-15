// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Myinicial extends StatefulWidget {
  const Myinicial({super.key});

  @override
  State<Myinicial> createState() => _MyinicialState();
}

class _MyinicialState extends State<Myinicial> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 78, 158, 90),
        leading: Image.asset('assets/imgs/logo.png', height: 350, width: 350,),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              DecoratedBox(decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 158, 90)),
              child: 
              Padding(
                padding: EdgeInsets.all(30),
                child: 
                Column(children: [
                  Text("Reciclar e reutilizar, não deixe o momento passar!", style: TextStyle(color: Colors.white, fontSize: 35, fontFamily: 'Nunito', fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  Text("Aqui as suas ideias são salvadoras.", style: TextStyle(color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      
                    });

                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color.fromARGB(255,0,72,82),
                    );
                  }, child: Text("Veja mais"))
                ],)
                
              ),),

        ],)),
    );
  }
}