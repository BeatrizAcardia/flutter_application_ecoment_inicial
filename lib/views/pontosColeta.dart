// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, file_names, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, unnecessary_import, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:br_validators/br_validators.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/Controller/MapaController.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/Endereco.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PontosColeta extends StatefulWidget {
  const PontosColeta({super.key});

  @override
  State<PontosColeta> createState() => _PontosColetaState();
}

class _PontosColetaState extends State<PontosColeta> {
  final TextEditingController searchController2 = TextEditingController();

  //final controllerMapa = Get.put(MapaController());

  final ondacima = SizedBox(
    child: Image.asset('assets/imgs/ondamapa.png'),
  );

  final mapa = SizedBox(
    child: Image.asset('assets/imgs/mapa.png'),
  );

  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          children: [
            ondacima,
            SizedBox(
              width: 350,
              height: 40,
              child: TextField(
                controller: searchController2,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  hintText: 'CEP, endereço ou coordenadas',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.only(left: 15, bottom: 20, top: 0),
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (text) {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Column(
                children: [
                  mapa,
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "EcoPonto - Marginal Tatu",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Centro de reciclagem",
                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "R. Antônio Lucato, 1883-1931 - Vila Camargo, Limeira - SP",
                  style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Seg. a Sex.      07h30 - 17h00",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sábado           07h30 - 12h00",
                  style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                ),
              ],
            ),
            Row(
              children: [
                Container(child: Column(children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Domingo         Fechado",
                  style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                ),
                ],
                ),
                height: 100,)

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetBottomAppBar(scaffoldKey: _scaffoldKey),
    );
  }
}
