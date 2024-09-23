// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  double myLat = 0, myLong = 0;
  TextEditingController cepController = TextEditingController();
  MapController mapController = MapController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OpenStreetMaps',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  child: Maps(),
                ),
                SizedBox(
                  height: 20,
                ),
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
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                ElevatedButton(
                    onPressed: () => buscar(cepController.text),
                    child: Text("buscar"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> buscar(String cep) async {
    if (cep == "") {
      mapController.move(LatLng(-22.8161490, -47.0686510), 10.0);
      setState(() {
        
      });
    } else {
      var url = Uri.parse(
          "https://api.distancematrix.ai/maps/api/geocode/json?address=${cep}&key=BWxx9qPxW8xHiGX9ZWx6iVYAAOCcJpbvXeKc8Zt9ryPoZgnuvKTcNODv8O17V5oM");
      http.Response response;
      response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> dadosFormatados = jsonDecode(response.body);
          myLat = (dadosFormatados['result'][0]['geometry']['location']['lat']);
          myLong =
              (dadosFormatados['result'][0]['geometry']['location']['lng']);
          print("Latitude: " + myLat.toString());
          print("\nLongitude: " + myLong.toString());
          mapController.move(LatLng(myLat, myLong), 15.0);
        });
      }
    }
  }

  Widget Maps() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter:
            LatLng(-22.8161490, -47.0686510), // Center the map over London
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          // Display map tiles from any source
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
          userAgentPackageName: 'com.example.app',
          maxNativeZoom:
              19, // Scale tiles when the server doesn't support higher zoom levels
          // And many more recommended properties!
        ),
        MarkerLayer(markers: [
          Marker(
            point: LatLng(myLat, myLong),
            child: Icon(
              Icons.location_pin,
              size: 30,
              color: Colors.greenAccent,
            ),
          ),
          Marker(
            point: LatLng(-20.60033896957386, -40.408191603245434),
            child: Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 30,
            ),
          ),
        ])
      ],
    );
  }
}
