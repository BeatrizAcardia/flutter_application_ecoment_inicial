// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';

class ContaUsuario extends StatefulWidget {
  Pessoa pessoa = Pessoa.n();
  ContaUsuario({super.key});
  ContaUsuario.pessoa(this.pessoa, {super.key});

  @override
  State<ContaUsuario> createState() => _ContaUsuarioState();
}

class _ContaUsuarioState extends State<ContaUsuario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 113, 39),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 59, 113, 39),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.pessoa.fotoPerfil == null
                          ? Image.asset("assets/imgs/do-utilizador.png",
                              width: 100, height: 100)
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              child: Image.memory(
                                widget.pessoa.fotoPerfil!,
                                width: 100,
                                height: 100,
                              )),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome do Usuário",
                            style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.pessoa.username,
                            style: TextStyle(
                              fontFamily: 'Circe',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget.pessoa.biografia,
                            style: TextStyle(
                              fontFamily: 'Circe',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Seguidores: ${widget.pessoa.qtdeSeguidores}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Circe',
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Seguindo: ${widget.pessoa.qtdeSeguindo}",
                          style: TextStyle(
                            fontFamily: 'Circe',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: Text(
                          "Curtidas: ${widget.pessoa.qtdeCurtidas}",
                          style: TextStyle(
                            fontFamily: 'Circe',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reputação: ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Circe',
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            ...gerarEstrelaColorida(widget.pessoa.reputacao),
                            ...gerarEstrelaNColorida(
                                5 - widget.pessoa.reputacao)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Seguir",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Circe',
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 59, 83, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/imgs/ondaVerdeconta.png",
                fit: BoxFit.cover,
              ),
            ),
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
}
