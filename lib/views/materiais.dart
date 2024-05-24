// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  String icone = "";
  String tituloPrincipal = "";
  String titulo1 = "";
  String titulo2 = "";
  String titulo3 = "";
  String titulo4 = "";
  String descricao = "";
  String descricao2 = "";
  String descricao3 = "";
  String descricao4 = "";

  Color cor = Colors.transparent;

  Tabbar(
      this.icone,
      this.tituloPrincipal,
      this.cor,
      this.descricao,
      this.descricao2,
      this.descricao3,
      this.descricao4,
      this.titulo1,
      this.titulo2,
      this.titulo3,
      this.titulo4,
      {Key? key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('${widget.icone}')),
                Text(
                  widget.titulo1,
                  style: TextStyle(color: widget.cor),
                ),
              ],
            ),
            elevation: 10,
            bottom: TabBar(
              controller: _tabController,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.titulo1),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.titulo2),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.titulo3),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(widget.titulo4),
                  ),
                ),
              ],
            )),
        body: Container(
          padding: EdgeInsets.all(20),
          child: TabBarView(
            controller: _tabController,
            children: [
              Text(widget.descricao, textAlign: TextAlign.justify),
              Text(widget.descricao2, textAlign: TextAlign.justify),
              Text(widget.descricao3, textAlign: TextAlign.justify),
              Text(widget.descricao4, textAlign: TextAlign.justify),
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    home: Tabbar("", "", Colors.transparent, "", "", "", "", "", "", "", ""),
  ));
}
