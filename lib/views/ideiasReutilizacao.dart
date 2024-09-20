// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IdeiasReutilizacao extends StatefulWidget {
  const IdeiasReutilizacao({super.key});

  @override
  State<IdeiasReutilizacao> createState() => _IdeiasReutilizacaoState();
}

class _IdeiasReutilizacaoState extends State<IdeiasReutilizacao> {
  int activeIndex = 0;

  List<Ideia> listaIdeias = [
    Ideia(
        "Apanhador de frutas com cano PVC e garrada PET",
        "assets/imgs/ideia1.jpg",
        Colors.red,
        5,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos1",
        ['material 1', 'material 2']),
    Ideia("titulo2", "assets/imgs/ideia2.jpg", Colors.green, 4, "bagulho foda",
        "1 passo, 2 passo", "carlinhos2", ['material 1', 'material 2']),
    Ideia("titulo3", "assets/imgs/ideia1.jpg", Colors.yellow, 3, "bagulho foda",
        "1 passo, 2 passo", "carlinhos3", ['material 1', 'material 2']),
    Ideia("titulo4", "assets/imgs/ideia2.jpg", Colors.green, 1, "bagulho foda",
        "1 passo, 2 passo", "carlinhos4", ['material 1', 'material 2']),
    Ideia("titulo5", "assets/imgs/ideia2.jpg", Colors.red, 2, "bagulho foda",
        "1 passo, 2 passo", "carlinhos5", ['material 1', 'material 2']),
  ];

  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextEditingController searchController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/fundo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 350,
                  height: 40,
                  child: TextField(
                    controller: searchController2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[800],
                      hintText: 'Você está procurando por...',
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
                    onChanged: (text) {},
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Veja outras ideias com:",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 27),
                ),
                SizedBox(height: 170),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Plástico",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        color: const Color.fromARGB(255, 208, 46, 46),
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias[index];
                        return buildIdeia(ideia, index);
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(100, 50)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
                SizedBox(
                  height: 100,
                ),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Metal",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        color: Colors.yellow[600],
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias[index];
                        return buildIdeia(ideia, index);
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(100, 50)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
                SizedBox(
                  height: 100,
                ),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Vidro",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        color: Colors.green[600],
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias[index];
                        return buildIdeia(ideia, index);
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(100, 50)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
                SizedBox(
                  height: 100,
                ),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Orgânico",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        color: Colors.brown[600],
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias[index];
                        return buildIdeia(ideia, index);
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(100, 50)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
                SizedBox(
                  height: 100,
                ),
                Row(children: [
                  SizedBox(width: 20),
                  Text(
                    "Madeira",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Column(
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias[index];
                        return buildIdeia(ideia, index);
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(100, 50)),
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          "Veja mais",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
              ],
            ),
            width: 450,
            height: 3050,
          ),
        ),
        bottomNavigationBar: WidgetBottomAppBar(scaffoldKey: _scaffoldKey));
  }

  //---- CARROSSEL ----
  Widget buildIdeia(Ideia ideia, int index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageIdeia(
                ideia.titulo,
                ideia.desc,
                ideia.img,
                ideia.dificuldade,
                ideia.passoPasso,
                ideia.avaliacao,
                ideia.autor,
                ideia.materiais),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: 390, // Espaçamento fora do card
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo do card
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Define o border radius na imagem
                  child: Image.asset(
                    ideia.img,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '@${ideia.autor}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: ideia.dificuldade,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                Text(
                  ideia.titulo,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "200",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
//----- FIM CARROSSEL ----

  Widget gerarCard(Ideia ideia) {
    return IntrinsicHeight(
      child: MouseRegion(
          child: GestureDetector(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 500, // Espaçamento fora do card
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo do card
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Define o border radius na imagem
                  child: Image.asset(
                    ideia.img,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 220,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '@${ideia.autor}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: ideia.dificuldade,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    ideia.titulo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "200",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  ],
                )

                // Adicione mais informações da ideia aqui
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PageIdeia(
                      ideia.titulo,
                      ideia.desc,
                      ideia.img,
                      ideia.dificuldade,
                      ideia.passoPasso,
                      ideia.avaliacao,
                      ideia.autor,
                      ideia.materiais)));
        },
      )),
    );
  }

  List<Widget> gerarEstrelaColorida(int n) {
    List<Widget> avaliacao = [];
    for (int i = 0; i < n; i++) {
      avaliacao.add(Icon(Icons.star, color: Colors.orange));
    }
    return avaliacao;
  }

  List<Widget> gerarEstrelaNColorida(int n) {
    List<Widget> avaliacao = [];
    for (int i = 0; i < n; i++) {
      avaliacao.add(Icon(Icons.star_border, color: Colors.orange));
    }
    return avaliacao;
  }
}
