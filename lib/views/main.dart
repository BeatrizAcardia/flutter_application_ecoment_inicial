// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/ideiasGerais.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/login.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';
import 'package:flutter_application_ecoment_inicial/views/sobre_nos.dart';
import 'package:flutter_application_ecoment_inicial/views/teste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoMoment',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 58, 118, 183)),
        useMaterial3: true,
      ),
      home: SobreNos(),
    );
  }
}

