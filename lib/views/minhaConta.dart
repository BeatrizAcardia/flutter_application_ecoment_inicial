// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/Data/Get.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/ideia.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/repository/ideiaRepository.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/ideia.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/login.dart';
import 'package:flutter_application_ecoment_inicial/views/pontosColeta.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_ecoment_inicial/views/preferencias.dart';
import 'package:provider/provider.dart';

class MinhaConta extends StatefulWidget {
  Pessoa pessoa = Pessoa.n();
  MinhaConta({super.key});

  @override
  State<MinhaConta> createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  int activeIndex = 0;

  TextStyle label1 = TextStyle(
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 46, 46, 46),
      fontSize: 20,
      fontFamily: 'Circe');

  TextStyle label2 = TextStyle(
      color: const Color.fromARGB(255, 46, 46, 46),
      fontSize: 20,
      fontFamily: 'Nunito');

  final ideiaVerde = SizedBox(
      width: 40,
      height: 40,
      child: Image.asset('assets/imgs/ideiaIconVerde.png'));

  TextStyle ideaTitle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Circe',
    fontWeight: FontWeight.w700,
  );

  double tamanhoContainterCinza = 500;

  Get getBanco = Get();

  List<Ideia> listaIdeias2 = [];

  

  List<Ideia> listaIdeias = [
    Ideia(
        "Apanhador de frutas com cano PVC e garrada PET",
        "assets/imgs/ideia1.jpg",
        "dificil",
        5,
        "O apanhador de frutas feito com cano PVC e garrafa PET é um dispositivo prático e eficiente para colher frutas diretamente das árvores, especialmente aquelas que estão fora do alcance das mãos. Este apanhador é composto por um longo cano de PVC, que serve como o cabo do dispositivo, proporcionando a extensão necessária para alcançar frutas em árvores altas. Na extremidade superior do cano, é acoplada uma garrafa PET reciclada, que é cortada de forma a criar uma abertura suficiente para segurar e desprender as frutas dos galhos com facilidade\nA garrafa PET, além de ser uma solução sustentável ao reutilizar materiais plásticos, é flexível e resistente, garantindo que as frutas sejam colhidas sem danos. A borda da garrafa pode ser ajustada para ter pequenos dentes ou serros que auxiliam no corte do talo das frutas, facilitando ainda mais o processo de colheita.\nEste apanhador de frutas é ideal para quem possui árvores frutíferas em casa ou em pequenas propriedades, permitindo uma colheita segura e eficiente",
        "1 passo, 2 passo",
        "carlinhos1",
        'material 1'),
    Ideia("titulo2", "assets/imgs/ideia2.jpg", "facil", 4, "bagulho foda",
        "1 passo, 2 passo", "carlinhos2", 'material 1'),
    Ideia("titulo3", "assets/imgs/ideia1.jpg", "media", 3, "bagulho foda",
        "1 passo, 2 passo", "carlinhos3", 'material 1'),
    Ideia("titulo4", "assets/imgs/ideia2.jpg", "facil", 1, "bagulho foda",
        "1 passo, 2 passo", "carlinhos4", 'material 1'),
    Ideia("titulo5", "assets/imgs/ideia2.jpg", "dificil", 2, "bagulho foda",
        "1 passo, 2 passo", "carlinhos5", 'material 1'),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle nunito = TextStyle(fontFamily: 'Nunito');

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
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
            child: Text('Entrar', style: nunito),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  )); // Fecha o diálogo
            },
          ),
          CupertinoDialogAction(
            child: Text('Cadastro', style: nunito),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cadastro(),
                  )); // Fecha o diálogo
            },
          ),
        ],
      ),
    ).then((_) {
      // Quando o diálogo é fechado (incluindo ao clicar fora)
      // Redireciona para a página de Login ou inicial se necessário
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Myinicial()), // Pode ser a página inicial ou login
        (route) => false, // Remove todas as rotas anteriores
      );
    });
  }
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    carregarIdeias();
  }

  // Função assíncrona para carregar as ideias
  Future<void> carregarIdeias() async {
    final user = Provider.of<UsuarioProvider>(context, listen: false);
    if (user.email == "" || user.email == null) {
      // Se o usuário não estiver logado, exibe o diálogo de erro
      setState(() {
        hasError = true;
      });
      return;
    }
    
    try {
      print("Antes da atribuição");
      listaIdeias2 = await getBanco.findIdeiaByNomeUsuario(user.username);
      print("Depois da atribuição");
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
  Widget build(BuildContext context) {
    final user = Provider.of<UsuarioProvider>(context, listen: false);
    if (hasError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorDialog(context);
      });
      return Scaffold(
        appBar: AppBar(title: Text("Erro")),
        body: Center(child: Text("Erro ao carregar a página.")),
      );
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 59, 113, 39),
          title: Text(
            "Minha conta",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.brightness_low_rounded),
              color: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPreferencias(),
                  )),
            )
          ],
        ),
        drawer: WidgetDrawer(),
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 113, 39),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 90,
                                height: 90,
                                child: Image.asset(
                                    "assets/imgs/do-utilizador.png"),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${user.username}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "${user.email}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 15),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
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
                                            text:
                                                user.qtdeSeguidores.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      RichText(
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
                                            text: user.qtdeSeguindo.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  RichText(
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
                                            text: user.qtdeCurtidas.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 15),
                                          ),
                                        ]),
                                      ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  /* user.setName(""); */
                                  user.setUsername("");
                                  user.setEmail("");
                                  user.setSenha("");
                                },
                                icon: Icon(Icons.output_sharp),
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 510,
                      child: Image.asset("assets/imgs/ondaVerdeconta.png"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Minhas ideias",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    listaIdeias2.isNotEmpty ?
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index),
                        height: 320, // Altura do carrossel
                      ),
                      itemCount: listaIdeias2.length,
                      itemBuilder: (context, index, realIndex) {
                        final ideia = listaIdeias2[index];
                        return buildIdeia(ideia, index);
                      },
                    ) : Center(
                      child: Text("Nenhuma ideia encontrada"),
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Favoritos",
                          style: TextStyle(
                            color: Color.fromARGB(255, 58, 125, 68),
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ideiaVerde,
                      ],
                    ),
                    listaIdeias.isNotEmpty ?
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
                    ): Center(
                      child: Text("Nenhuma ideia encontrada"),
                    ),
                  ]),
                ),
                height: 1190,
              ),
            ),
            WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
          ],
        ));
  }

  //---- CARROSSEL ----
  Widget buildIdeia(Ideia ideia, int index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageIdeia(
                ideia.nomePostagem,
                ideia.desc,
                ideia.img1,
                ideia.dificuldade,
                ideia.passoPasso,
                ideia.avaliacao,
                ideia.nomeUsuario,
                ideia.materiais),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          width: 400, // Espaçamento fora do card
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
                    ideia.img1,
                    fit: BoxFit.cover,
                    height: 170,
                    width: 220,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '${ideia.nomeUsuario}',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: definirCor(ideia.dificuldade),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                Text(
                  ideia.nomePostagem,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
//----- FIM CARROSSEL ----

  Widget gerarCard(
      String titulo,
      String imgUrl,
      String dificuldade,
      double avaliacao,
      String desc,
      String passoPasso,
      String autor,
    String listaMat) {
    return MouseRegion(
        child: GestureDetector(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 217, 217, 217)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "$imgUrl",
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              titulo,
              style: ideaTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...gerarEstrelaColorida(avaliacao),
                    ...gerarEstrelaNColorida(5 - avaliacao)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: definirCor(dificuldade)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageIdeia(titulo, desc, imgUrl,
                    dificuldade, passoPasso, avaliacao, autor, listaMat)));
      },
    ));
  }

  List<Widget> gerarEstrelaColorida(double n) {
    List<Widget> avaliacao = [];
    for (int i = 0; i < n; i++) {
      avaliacao.add(Icon(Icons.star, color: Colors.orange));
    }
    return avaliacao;
  }

  List<Widget> gerarEstrelaNColorida(double n) {
    List<Widget> avaliacao = [];
    for (int i = 0; i < n; i++) {
      avaliacao.add(Icon(Icons.star_border, color: Colors.orange));
    }
    return avaliacao;
  }

  Color definirCor(String dificuldade){
    if(dificuldade == "facil"){return  Colors.green;}
    else if(dificuldade == "media"){return Colors.yellow;}
    else if (dificuldade == "dificil"){return Colors.red;}
    return Colors.black;
  }
}
