// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_final_fields, avoid_function_literals_in_foreach_calls, unused_import, prefer_const_declarations, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/login.dart';
import 'package:provider/provider.dart';

class PageIdeia extends StatefulWidget {
  

  Ideia ideia = Ideia.vazia();

  PageIdeia.ideia(this.ideia, {super.key});

  @override
  State<PageIdeia> createState() => _IdeiaState();
}

class _IdeiaState extends State<PageIdeia> {
  TextStyle titulo = TextStyle(
    fontSize: 29,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Poppins',
  );
  TextStyle autor = TextStyle(
    fontSize: 17,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool estado = false;
  bool scaleUp = false;

    Color definirCor(String dificuldade){
    if(dificuldade == "facil"){return  Colors.green;}
    else if(dificuldade == "media"){return Colors.yellow;}
    else if (dificuldade == "dificil"){return Colors.red;}
    return Colors.black;
  }

  void muda() {
    setState(() {
      estado = !estado;
      scaleUp = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        scaleUp = false;
      });
    });
  }

  TextStyle nunito = TextStyle(fontFamily: 'Nunito');

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Cadastre ou faça o Login',
          style: nunito,
        ),
        content: Text(
          'Essa funcionalidade é inacessivel para convidados. Faça o Login ou cadastre-se para ter acesso a essa funcionalidade',
          style: nunito,
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('OK', style: nunito),
            onPressed: () {
              Navigator.pop(context); // Fecha o diálogo
              Navigator.pop(context); // Volta para a página anterior
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      drawer: WidgetDrawer(),
      backgroundColor: const Color(0xfff4f4f4),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 80),
                child: Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                      Text(
                        widget.ideia.nomePostagem,
                        style: titulo,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.ideia.nomeUsuario, style: autor),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.ideia.img1,
                          fit: BoxFit.contain,
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      ...gerarEstrelaColorida(widget.ideia.avaliacao),
                                      ...gerarEstrelaNColorida(
                                          5 - widget.ideia.avaliacao)
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Avaliações: ",
                                          style:
                                              TextStyle(fontFamily: 'Poppins'),
                                        ),
                                        Text(
                                          widget.ideia.qtdeAvaliacoesPostagem.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Dificuldade "),
                                Icon(
                                  Icons.circle,
                                  color: definirCor(widget.ideia.dificuldade),
                                  size: 30,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Favoritar "),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                          onTap: /* user.name */ user.email == ""
                                              ? () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        CupertinoAlertDialog(
                                                      title: Text(
                                                        'Cadastre-se ou faça o Login',
                                                        style: nunito,
                                                      ),
                                                      content: Text(
                                                        'Essa funcionalidade é inacessivel para convidados. Faça o Login ou cadastre-se para ter acesso a essa funcionalidade',
                                                        style: nunito,
                                                      ),
                                                      actions: [
                                                        CupertinoDialogAction(
                                                          child: Text('Entrar',
                                                              style: nunito),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context, MaterialPageRoute(builder: (context) => Login(),)); // Fecha o diálogo
                                                          },
                                                        ),
                                                        CupertinoDialogAction(
                                                          child: Text('Cadastro',
                                                              style: nunito),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context, MaterialPageRoute(builder: (context) => Cadastro(),)); // Fecha o diálogo
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              : muda,
                                          child: AnimatedScale(
                                            scale: scaleUp ? 1.5 : 1.0,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                            child: Icon(
                                              estado
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Compartilhar "),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.share,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        onTap: () async {},
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Icon(Icons.check_box_outline_blank),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Materiais",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Circe',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [Text(widget.ideia.materiais)],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Icon(Icons.temple_buddhist_sharp),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Passo a Passo",
                                style: TextStyle(
                                    fontFamily: 'Circe',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Text(
                              widget.ideia.passoPasso,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Icon(Icons.chat_bubble),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Comentários",
                              style: TextStyle(
                                  fontFamily: 'Circe',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Começo - Comentario do carlinhos
                      Container(
                        width: 300,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all()),
                        child: Column(
                          children: [
                            Text("@Carlinhos", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold),),
                            Text(
                              "Muito lindo, amei <3",
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ),
                      //Fim - Comentario do carlinhos 

                    ],
                  ),
                ),
              ),
            ),
            WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
          ],
        ),
      ),
    );
  }

List<Widget> gerarEstrelaColorida(double n) {
  List<Widget> avaliacao = [];
  int numeroEstrelas = n.floor(); // Arredonda para baixo
  for (int i = 0; i < numeroEstrelas; i++) {
    avaliacao.add(Icon(
      Icons.star,
      color: Colors.orange,
      size: 25,
    ));
  }
  return avaliacao;
}

List<Widget> gerarEstrelaNColorida(double n) {
  List<Widget> avaliacao = [];
  for (int i = 0; i < n; i++) {
    avaliacao.add(Icon(
      Icons.star_border,
      color: Colors.orange,
      size: 25,
    ));
  }
  return avaliacao;
}

  /* List<Widget> materiais() {
    List<Widget> lista = [];
    widget.listaMateriais.forEach((String m) {
      lista.add(Text(
        "- " + m,
        style: TextStyle(
          fontFamily: 'Nunito',
        ),
      ));
    });
    return lista;
  } */
}
