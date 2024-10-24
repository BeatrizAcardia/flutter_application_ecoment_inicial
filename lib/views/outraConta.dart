// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/Data/Postagem/Postagem.dart';
import 'package:flutter_application_ecoment_inicial/Data/Seguidor/GetSeguidor.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';

class ContaUsuario extends StatefulWidget {
  Pessoa pessoa = Pessoa.n();
  ContaUsuario({super.key});
  ContaUsuario.pessoa(this.pessoa, {super.key});

  @override
  State<ContaUsuario> createState() => _ContaUsuarioState();
}

class _ContaUsuarioState extends State<ContaUsuario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );

  List<Ideia> listaIdeias2 = [];

  bool isLoading = false;

  int activeIndex = 0;

  Postagem getPostagem = Postagem();

  List<Pessoa> listaUsuariosSeguindo = [];
  List<Pessoa> listaUsuariosSeguidores = [];
  GetSeguidor getSeguidorBD = GetSeguidor();

  void _mostrarListaUsuarioSeguindo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Usuarios que eu sigo:"),
          content: Container(
            width: double.maxFinite, // para garantir que o conteúdo se ajuste
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              shrinkWrap: true, // para ajustar a lista no diálogo
              itemCount: widget.pessoa.qtdeSeguindo,
              itemBuilder: (BuildContext context, int index) {
                return listaUsuariosSeguindo.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                _navigatorToAntoherAccount(
                                    listaUsuariosSeguindo[index]);
                              },
                              child: Row(
                                children: [
                                  listaUsuariosSeguindo[index].fotoPerfil !=
                                          null
                                      ? ClipRRect(
                                          child: Image.memory(
                                            listaUsuariosSeguindo[index]
                                                .fotoPerfil!,
                                            height: 40,
                                            width: 40,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        )
                                      : Image.asset(
                                          "assets/imgs/do-utilizador.png",
                                          height: 40,
                                          width: 40,
                                          color: Colors.black),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(listaUsuariosSeguindo[index].username)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: Text("Nenhum usuario seguindo no momento"),
                      );
              },
            ),
          ),
        );
      },
    );
  }

  void _mostrarListaUsuarioSeguidores(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Usuarios que me seguem:"),
          content: Container(
            width: double.maxFinite, // para garantir que o conteúdo se ajuste
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              shrinkWrap: true, // para ajustar a lista no diálogo
              itemCount: widget.pessoa.qtdeSeguidores,
              itemBuilder: (BuildContext context, int index) {
                return listaUsuariosSeguidores.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                _navigatorToAntoherAccount(
                                    listaUsuariosSeguidores[index]);
                              },
                              child: Row(
                                children: [
                                  listaUsuariosSeguidores[index].fotoPerfil !=
                                          null
                                      ? ClipRRect(
                                          child: Image.memory(
                                            listaUsuariosSeguidores[index]
                                                .fotoPerfil!,
                                            height: 40,
                                            width: 40,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        )
                                      : Image.asset(
                                          "assets/imgs/do-utilizador.png",
                                          height: 40,
                                          width: 40,
                                          color: Colors.black),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(listaUsuariosSeguidores[index].username)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child:
                            Text("Nenhum usuario esta te seguindo no momento"),
                      );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _navigatorToAntoherAccount(Pessoa pessoa) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContaUsuario.pessoa(pessoa),
        ));
  }

  Future<void> loadData() async {
    try {
      listaUsuariosSeguindo =
          await getSeguidorBD.listaUsuariosSeguindo(widget.pessoa.idUsuarioWeb);

      listaUsuariosSeguidores = await getSeguidorBD
          .listaUsuariosSeguidores(widget.pessoa.idUsuarioWeb);

      listaIdeias2 = await getPostagem.getPostagem
          .findIdeiaByNomeUsuarioOrderByNCurtidas(widget.pessoa.username);
    } catch (e) {
      print("Erro ao carregar ideias: $e");
    } finally {
      // Atualiza o estado para remover o loader
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

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
                        child: GestureDetector(
                          onTap: () => _mostrarListaUsuarioSeguidores(context),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Seguidores: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.pessoa.qtdeSeguidores.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: GestureDetector(
                          onTap: () => _mostrarListaUsuarioSeguindo(context),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "Seguindo: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.pessoa.qtdeSeguindo.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 15),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.all(1),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Curtidas: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            TextSpan(
                              text: widget.pessoa.qtdeCurtidas.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            ),
                          ]),
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
            SizedBox(
              height: 20,
            ),
            Text(
              "Minhas ideias",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : listaIdeias2.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: definirNumeroColunas(
                              context), // Define dinamicamente o número de colunas
                          crossAxisSpacing: 10, // Espaçamento entre as colunas
                          mainAxisSpacing: 10, // Espaçamento entre as linhas
                          childAspectRatio: definirProporcao(
                              context), // Ajusta a proporção dinamicamente
                        ),
                        itemCount: listaIdeias2.length,
                        itemBuilder: (context, index) {
                          final ideia = listaIdeias2[index];
                          return buildIdeia(ideia, index);
                        },
                        padding:
                            EdgeInsets.all(10), // Padding ao redor do GridView
                        shrinkWrap:
                            true, // Permite que o GridView se ajuste ao conteúdo
                        physics:
                            BouncingScrollPhysics(), // Comportamento de rolagem
                      )
                    : Center(
                        child: Text("Nenhuma ideia encontrada"),
                      ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget buildIdeia(Ideia ideia, int index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageIdeia.ideia(ideia),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo do card
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey[700]!, width: 2),
          ),
          child: Stack(
            children: [
              // Imagem da ideia
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: Image.asset(
                  ideia.img1,
                  fit: BoxFit.cover,
                  width:
                      MediaQuery.of(context).size.width, // Ocupa toda a largura
                  height: 250, // Ajuste de altura conforme necessário
                ),
              ),
              // Informações acima da imagem
              Positioned(
                bottom: 0, // Posição no topo
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Fundo branco
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            '${ideia.nomeUsuario}',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.circle,
                            color: definirCor(ideia.dificuldade),
                            size: 20,
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        ideia.nomePostagem,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 2, // Limita a no máximo 2 linhas
                        overflow: TextOverflow
                            .ellipsis, // Adiciona "..." se o texto exceder 2 linhas
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ideia.numeroCurtidas.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

//----- CARD ----
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

  Color definirCor(String dificuldade) {
    if (dificuldade == "facil") {
      return Colors.green;
    } else if (dificuldade == "media") {
      return Colors.yellow;
    } else if (dificuldade == "dificil") {
      return Colors.red;
    }
    return Colors.black;
  }

  int definirNumeroColunas(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    if (larguraTela >= 1200) {
      return 4; // Tela muito grande (desktop, etc)
    } else if (larguraTela >= 800) {
      return 3; // Tela média (tablets)
    } else if (larguraTela >= 600) {
      return 2; // Telas pequenas ou celulares grandes
    } else {
      return 2; // Celulares menores (1 coluna)
    }
  }

// Função para definir a proporção dinamicamente
  double definirProporcao(BuildContext context) {
    int colunas = definirNumeroColunas(context);
    if (colunas == 1) {
      return 1.5; // Proporção mais alta para quando há 1 coluna
    } else {
      return 0.75; // Proporção mais equilibrada para 2 ou mais colunas
    }
  }
}
