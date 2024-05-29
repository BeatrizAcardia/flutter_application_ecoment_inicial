// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, must_be_immutable, avoid_web_libraries_in_flutter, unused_import, prefer_const_literals_to_create_immutables

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';

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

    TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );


  List<Ideia> listaIdeias = [
    Ideia.n("Apanhador de frutas com cano PVC e garrada PET", "assets/imgs/ideia1.jpg", Colors.red, 5, "bagulho foda", "1 passo, 2 passo", "carlinhos1", ['material 1','material 2'],"Plástico"),
    Ideia.n("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 4, "bagulho foda", "1 passo, 2 passo", "carlinhos2", ['material 1','material 2'], "Plástico"),
    Ideia.n("teste3", "assets/imgs/ideia1.jpg", Colors.yellow, 3, "bagulho foda", "1 passo, 2 passo", "carlinhos3", ['material 1','material 2'], "Metal"),
    Ideia.n("teste4", "assets/imgs/ideia2.jpg", Colors.green, 1, "bagulho foda", "1 passo, 2 passo", "carlinhos4", ['material 1','material 2'], "Papel"),
    Ideia.n("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 2, "bagulho foda", "1 passo, 2 passo", "carlinhos5", ['material 1','material 2'],"Vidro"),
  ];

  List<Ideia> listaFiltrada = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  
 final dropValue = ValueNotifier('');
 final opcoes = ['Dificuldade', 'Avaliações', 'Curtidas'];

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      key: _scaffoldKey,
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

      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
        child: Container(
          child: Column(
          children: [
            Container(
              height: 400, // Ajuste conforme necessário
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Text(widget.descricao, textAlign: TextAlign.justify),
                      SizedBox(height: 10,),
                      Table(
                        border: TableBorder.all(color: Colors.white30),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.redAccent
                            ),
                            children: [
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('Title1'),
                              )
                              ),
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('Title2'),
                              )
                              ),
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('Title3'),
                              )
                              ),
                            ],
                          ),
                          ...List.generate(20, (index) => TableRow(
                            children: [
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('cell1'),)),
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('cell2'),)),
                              TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                              child: Text('cell3'),)),
                            ]
                          ))
                        ],
                      )
                    ],)
                  ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao2, textAlign: TextAlign.justify),
                  ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao3, textAlign: TextAlign.justify),
                  ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(widget.descricao4, textAlign: TextAlign.justify),
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.titulo2,
                    style: TextStyle(
                      color: widget.cor,
                      fontFamily: 'Nunito',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                   Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Adiciona o padding desejado
                          child: ValueListenableBuilder(
                            valueListenable: dropValue,
                            builder: (BuildContext context, String value, _) {
                              return Row(
                                children: [
                                  Icon(Icons.filter_alt, color: widget.cor), // Ícone desejado ao lado do hintText
                                  SizedBox(width: 8), // Espaçamento entre o ícone e o DropdownButton
                                  DropdownButton(
                                    hint: Text("Ordenar"),
                                    value: (value.isEmpty) ? null : value,
                                    onChanged: (escolha) => dropValue.value = escolha.toString(),
                                    items: opcoes.map((op) => DropdownMenuItem(
                                      value: op,
                                      child: Text(op),
                                    ),).toList()
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),

                     SizedBox(width: 100),
                      SizedBox(
                        width: 200,
                        height: 40, // Defina a largura desejada
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Buscar',
                            contentPadding: EdgeInsets.only(left: 15, bottom: 20, top: 5),
                            suffixIcon: Container(
                              decoration: BoxDecoration(
                                 color: widget.cor,
                                 borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                 ),
                              ),
                               child: Icon(Icons.search, color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (text) {
                            setState(() {
                              listaFiltrada = listaIdeias.where((idea) => idea.getTitulo.toLowerCase().contains(text.toLowerCase())).toList();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  listaIdeias.isNotEmpty ?
                  Container(
                    child:
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 250
                    ),
                      itemCount: numeroAndlistaFiltrado(),
                      itemBuilder: (context, index) {
                          return gerarCard(listaFiltrada[index].getTitulo, listaFiltrada[index].getImg, listaFiltrada[index].getDificuldade, listaFiltrada[index].getAvaliacao, listaFiltrada[index].getDesc, listaFiltrada[index].getPassoPasso, listaFiltrada[index].getAutor, listaFiltrada[index].getMateriais, listaFiltrada[index].getMaterial);
                      },
                      )
                      )
                      : Center(child: Text("Sem posts no momento. Que tal postar alguma coisa?", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),),

                      listaFiltrada.isEmpty?
                      Center(child: Text("Sem posts no momento. Que tal postar alguma coisa?", style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),)
                      :SizedBox.shrink(),
                ],
              ),
            ),
            )
          ],
        ),
        )
      ),
      WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
        ],
      )
    );
  }

  int numeroAndlistaFiltrado(){
    int numero = 0;
    for(int i = 0; i<listaIdeias.length; i++){
      if(listaIdeias[i].getMaterial.toLowerCase() == widget.titulo.toLowerCase()){
        numero ++;
        listaFiltrada.add(listaIdeias[i]);
      }
    }
    return numero;
  }


    Widget gerarCard (String titulo, String imgUrl, Color dificuldade, int avaliacao, String desc, String passoPasso, String autor, List<String> listaMat, String material){
    return MouseRegion(
      child: GestureDetector(
        child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 217, 217, 217)
      ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200,
                child: ClipRRect(borderRadius: BorderRadius.circular(10) ,child: Image.asset("$imgUrl", height: 130, fit: BoxFit.cover,),),
                ),
                Text(titulo, style: ideaTitle, textAlign: TextAlign.center,),
                SizedBox(height: 5,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...gerarEstrelaColorida(avaliacao),
                      ...gerarEstrelaNColorida(5-avaliacao)
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.circle, color: dificuldade),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PageIdeia(titulo, desc, imgUrl, dificuldade, passoPasso, avaliacao, autor, listaMat)));
        },
      )
    );
  }

  List<Widget> gerarEstrelaColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star, color: Colors.orange));
    }
    return avaliacao;
  }
  List<Widget> gerarEstrelaNColorida (int n){
    List<Widget> avaliacao = [];
    for(int i=0; i<n; i++){
      avaliacao.add(Icon(Icons.star_border, color: Colors.orange));
    }
    return avaliacao;
  }

}

void main() {
  runApp(MaterialApp(
    home: Tabbar("", Colors.transparent, "", "", "", "", "", "", "", "", "", ""),
  ));
}
