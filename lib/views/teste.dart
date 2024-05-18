// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
              child: Text('Conteúdo principal'),
            ),
            
          ],
        ),
      ));
  }
}