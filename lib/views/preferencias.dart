// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/views/sobre_nos.dart';

class TelaPreferencias extends StatefulWidget {
  const TelaPreferencias({super.key});

  @override
  State<TelaPreferencias> createState() => _TelaPreferenciasState();
}

class _TelaPreferenciasState extends State<TelaPreferencias> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      backgroundColor: Color(0xfff4f4f4),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back),
                        ),
                        Text(
                          'Preferências',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ajuda e Suporte',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => null,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/conversando.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Contate os editores",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () => null,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/compartilhar.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Compartilhe o EcoMoment",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SobreNos(),
                                )),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/simbolo-de-reciclagem.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sobre o EcoMoment",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ajuda e Suporte',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => null,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/editar-informacao.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                Text(
                                  "Editar perfil",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => null,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/mudar.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Trocar a senha",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => null,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icon/coracao-partido.png",
                                    height: 30,
                                    color: Color(0xff3A7D44),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Desativar conta",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 17),
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
              Container(
                child: Image.asset("assets/imgs/MOMENT.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
