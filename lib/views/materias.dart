// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  String icone = "";
  String titulo = "";
  String descricao = "";
  Color cor = Colors.transparent;

  Tabbar(this.icone, this.titulo, this.cor, this.descricao, {Key? key});

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
        title: Row( children: [
            SizedBox(height: 30, width: 30, child: Image.asset('${widget.icone}')),
            Text(widget.titulo, style: TextStyle(color: widget.cor),),
        ],),

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
                  child: Text("APPS"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("MOVIES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("GAMES"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("GAMES"),
                ),
              ),
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text(" fhddhss oidfhk eeiufuehfka JSHFUDFIS KASHDISH",
              textAlign: TextAlign.center),
          Text(" fhddhss oidfhk eeiufuehfka JSHFUDFIS KASHDISH",
              textAlign: TextAlign.center),
          Text(" fhddhss oidfhk eeiufuehfka JSHFUDFIS KASHDISH",
              textAlign: TextAlign.center),
          Text(" fhddhss oidfhk eeiufuehfka JSHFUDFIS KASHDISH",
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Tabbar("", "", Colors.transparent, ""),
  ));
}
