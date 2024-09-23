// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, file_names, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, unnecessary_import, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
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
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PontosColeta extends StatefulWidget {
  const PontosColeta({super.key});

  @override
  State<PontosColeta> createState() => _PontosColetaState();
}

class _PontosColetaState extends State<PontosColeta> {
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
  double myLat = 0, myLong = 0;
  MapController mapController = MapController();


  List<Endereco> listaEnd = [
    Endereco(0, 0, "", "", "", ""),
Endereco(-22.708023539710922, -47.367481737706875, "ECOPONTO - JARDIM DA PAZ", "Centro de reciclagem", "R. Estevão Carlos Vicentini, 175 - Jardim da paz, Americana - SP, 13469-804", "seg-sex 07:00-17:00 \n sáb 08:00-16:00"),
Endereco(-22.753604569375707, -47.30979351764844, "ECOPONTO - INDUSTRIAL WERNER PLAAS", "Depósito", "R. do Mecânico, 35 - Jardim Werner Plaas, Americana - SP, 13479", "seg-sex 07:00-17:00 \n sáb 08:00-12:00"),
Endereco(-22.71127111707305, -47.321384028889874, "ECOPONTO - NOVA CARIOBA", "Centro de reciclagem", "R. José Nicoleti, 110 - Parque Nova Carioba, Americana - SP, 13473-756", "seg-sex 07:00-17:00 \n sáb 08:00-12:00"),
Endereco(-22.766306643658144, -47.326258564471985, "ECOPONTO - JARDIM DOS LÍRIOS", "Centro de reciclagem", "R. das Seriemas, 550 - Vila Mathiesen, Americana - SP, 13467-310", "seg-sex 07:00-18:00 \n sáb 08:00-17:00 \n dom 08:00–12:00"),
Endereco(-22.73251215321659, -47.35166863162096, "Ecoponto - Catharina Zanaga", "Centro de reciclagem", "Av. Carminé Feola, 1327 - Catharina Zanaga, Americana - SP, 13469-360", "seg-sex 07:00-17:00 \n sáb 08:00-17:00"),
Endereco(-22.754585078966517, -47.320598802418026, "Excelente sustentabilidade", "Centro de reciclagem", "R. Tibiriçá, 1517 - Conserva, Americana - SP, 13466-044", "seg-sex 08:00-18:00 \n sáb 08:30-13:00"),
Endereco(-22.741716171418936, -47.279087186786825, "ECOPONTO JARDIM BOER - JARDIM BERTONI", "Centro de reciclagem", "Av. Roma, 4347-4499 - Jardim Mirandola, Americana - SP, 13478-860", "seg-sex 07:00-17:00 \n sáb 08:00-17:00 \n dom 08:00–12:00"),
Endereco(-22.698619907189443, -47.30384633283686, "Eco Parque - Descarte de materiais descartáveis", "Cooperativa", "Lot. Industrial Salto Grande II, Americana - SP, 13474-760", "--"),
Endereco(-22.69843026922708, -47.3047846744341, "ECOPONTO - ANTONIO ZANAGA", "Centro de reciclagem", "Av. do Raion Viscose, 209 - Lot. Industrial Salto Grande I, Americana - SP, 13474-760", "seg-sex 07:00–17:00 \n sáb 08:00–17:00"),
Endereco(-22.733249947638157, -47.39325330737262, "Ecoponto Planalto do Sol II", "Centro de reciclagem", "Av. Barretos - Frezzarin 2, Santa Bárbara d'Oeste - SP, 13453-830", "seg-dom 06:00–11:00 e 12:30–18:00"),
Endereco(-22.76047925318925, -47.372482281274586, "Ecoponto Jardim Gerivá", "Centro de reciclagem", "Av. Juscelino K. de Oliveira - Mollon, Santa Bárbara d'Oeste - SP", "seg-dom 06:00–11:00 e 12:30–18:00"),
Endereco(-22.76522799486505, -47.412736873175305, "Ecoponto Parque Olaria", "Centro de reciclagem", "R. Independência - Parque Olaria, Santa Bárbara d'Oeste - SP, 13458-020", "seg-dom 06:00–11:00 e 12:30–18:00"),
Endereco(-22.73028809480422, -47.35987639764068, "Eco Drive Thru - Jardim das Palmeiras", "Centro de reciclagem", "R. Ver. Francisco Cruz, 272-294 - Jardim Cândido Bertini, Santa Bárbara d'Oeste - SP, 13455-169", "Atendimento 24 horas"),
Endereco(-22.81134231790239, -47.3061424503688, "Ecoponto Nova Odessa", "Centro de reciclagem", "Rua Vilhelms Rosenbergs, s/n - Jardim Monte das Oliveiras, Nova Odessa - SP, 13460-000", "seg-dom 07:00–19:00"),
Endereco(-22.78309442121531, -47.282367350248336, "Ecoponto Triunfo - Nova Odessa", "Centro de reciclagem", "Av. Frederico Hansen, 263 - Nucleo Res. Triunfo, Nova Odessa - SP, 13460-000", "seg-dom 07:00–19:00")

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: WidgetDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ondacima,
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    
                    TextField(
                      controller: cepController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        hintText: 'CEP, endereço ou coordenadas',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.only(left: 15, bottom: 20, top: 0),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => buscar(cepController.text),
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (value) => buscar(cepController.text),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            height: 400,
                            child: Maps(listaEnd),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WidgetBottomAppBar(scaffoldKey: _scaffoldKey),
    );
  }

  Future<void> buscar(String cep) async {
    if (cep == "") {
      mapController.move(LatLng(-22.8161490, -47.0686510), 10.0);
      setState(() {});
    } else {
      var url = Uri.parse(
          "https://api.distancematrix.ai/maps/api/geocode/json?address=${cep}&key=BWxx9qPxW8xHiGX9ZWx6iVYAAOCcJpbvXeKc8Zt9ryPoZgnuvKTcNODv8O17V5oM");
      http.Response response;
      response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> dadosFormatados = jsonDecode(response.body);
          myLat = (dadosFormatados['result'][0]['geometry']['location']['lat']);
          myLong =(dadosFormatados['result'][0]['geometry']['location']['lng']);
          print("Latitude: " + myLat.toString());
          print("\nLongitude: " + myLong.toString());
          listaEnd[0].lat = myLat;
          listaEnd[0].long = myLong;
          listaEnd[0].adress = (dadosFormatados['result'][0]['formatted_address']);
          listaEnd[0].title = "EU";
          mapController.move(LatLng(myLat, myLong), 15.0);
        });
      }
    }
  }

  Widget Maps(List<Endereco> lista) {
  return FlutterMap(
    mapController: mapController,
    options: MapOptions(
      initialCenter: LatLng(-22.8161490, -47.0686510), // Define o centro do mapa
      initialZoom: 9.2,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
        maxNativeZoom: 19,
      ),
      MarkerLayer(
        markers: lista.map((endereco) {
          return Marker(
            point: LatLng(endereco.lat, endereco.long), // Pega as coordenadas do endereço
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('${endereco.title}'), // Nome do ecoponto
                  content: Text('Localizado em:\n${endereco.adress}'), // Detalhes do endereço
                  actions: [
                    CupertinoDialogAction(
                      child: Text('Fechar'),
                      onPressed: () => Navigator.pop(context, 'OK'),
                    ),
                  ],
                ),
              ),
              child: Icon(
                Icons.location_pin,
                size: 50,
                color: Colors.red,
              ),
            ),
          );
        }).toList(), // Gera a lista de marcadores
      ),
    ],
  );
}
  }
