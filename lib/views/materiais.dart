import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  String icone = "";
  String titulo = "";
  String titulo2 = "";
  String topico = "";
  String topico2 = "";
  String topico3 = "";
  String topico4 = "";
  String descricao = "";
  String descricao2 = "";
  String descricao3 = "";
  String descricao4 = "";

  Color cor = Colors.transparent;

  Tabbar(
    this.icone,
    this.cor,
    this.descricao,
    this.descricao2,
    this.descricao3,
    this.descricao4,
    this.titulo,
    this.titulo2,
    this.topico,
    this.topico2,
    this.topico3,
    this.topico4, {
    Key? key,
  });

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
              child: Image.asset('${widget.icone}'),
            ),
            Text(
              widget.titulo,
              style: TextStyle(color: widget.cor),
            ),
          ],
        ),
        elevation: 10,
        bottom: TabBar(
          controller: _tabController,
          labelColor: widget.cor,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
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
                child: Text(
                  widget.topico,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.topico2,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.topico3,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.topico4,
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 11.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400, // Ajuste conforme necessário
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao, textAlign: TextAlign.justify),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao2, textAlign: TextAlign.justify),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao3, textAlign: TextAlign.justify),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao4, textAlign: TextAlign.justify),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.titulo2,
                    style: TextStyle(
                      color: widget.cor,
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("cards de ideias aqui."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Tabbar("", Colors.transparent, "", "", "", "", "", "", "", "", "", ""),
  ));
}
