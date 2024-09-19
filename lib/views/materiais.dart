// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, must_be_immutable, avoid_web_libraries_in_flutter, unused_import, prefer_const_literals_to_create_immutables

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
    Ideia.n(
        "Apanhador de frutas com cano PVC e garrada PET",
        "assets/imgs/ideia1.jpg",
        Colors.red,
        5,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos1",
        ['material 1', 'material 2'],
        "Plástico"),
    Ideia.n(
        "titulo2",
        "assets/imgs/ideia2.jpg",
        Colors.green,
        4,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos2",
        ['material 1', 'material 2'],
        "Plástico"),
    Ideia.n(
        "teste3",
        "assets/imgs/ideia1.jpg",
        Colors.yellow,
        3,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos3",
        ['material 1', 'material 2'],
        "Metal"),
    Ideia.n(
        "teste4",
        "assets/imgs/ideia2.jpg",
        Colors.green,
        1,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos4",
        ['material 1', 'material 2'],
        "Papel"),
    Ideia.n(
        "titulo5",
        "assets/imgs/ideia2.jpg",
        Colors.red,
        2,
        "bagulho foda",
        "1 passo, 2 passo",
        "carlinhos5",
        ['material 1', 'material 2'],
        "Vidro"),
  ];

  List<Ideia> listaFiltrada = [];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final dropValue = ValueNotifier('');
  final opcoes = ['Dificuldade', 'Avaliações', 'Curtidas'];

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> data = [
    {
      "simbolo": "1",
      "sigla": "PET",
      "nome": "Politereftalato de etila",
      "onde":
          "Embalagens de refrigerante, água, sucos, cosméticos, cabides, entre outros."
    },
    {
      "simbolo": "2",
      "sigla": "PEAD",
      "nome": "Polietileno de alta densidade",
      "onde":
          "Baldes, sacolas, embalagens de xampu, amaciante, brinquedos, entre outros. Geralmente, o material é opaco ou translúcido."
    },
    {
      "simbolo": "3",
      "sigla": "PVC",
      "nome": "Policloreto de vinila",
      "onde":
          "Canos de tubulações, chinelos, couro sintético, mangueiras de jardim, cortinas de chuveiro, entre outros."
    },
    {
      "simbolo": "4",
      "sigla": "PEBD",
      "nome": "Polietileno de baixa densidade",
      "onde":
          "Embalagens de alimentos como açúcar, arroz, feijão, sal, entre outros. Normalmente seu aspecto é mais grosso e transparente."
    },
    {
      "simbolo": "5",
      "sigla": "PP",
      "nome": "Polipropileno",
      "onde":
          "Tampas de embalagens, copos plásticos, seringas de injeção, brinquedos, entre outros."
    },
    {
      "simbolo": "6",
      "sigla": "PS",
      "nome": "	Poliestireno",
      "onde":
          "	Copos descartáveis, isopor, pentes, embalagens para pastas, carcaças de eletrônicos, entre outros."
    },
    {
      "simbolo": "7",
      "sigla": "--",
      "nome": "Outros",
      "onde": "Embalagens mistas ou feitas de outros termoplásticos"
    },
  ];

  final List<Map<String, String>> table2 = [
    {},
    {},
    {},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: WidgetDrawer(),
        key: _scaffoldKey,
        appBar: AppBar(
          
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Row(
            children: [   
              SizedBox(width: 60),
                  Text(
                    widget.titulo,
                    style: TextStyle(color: widget.cor, fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                SizedBox(width: 10),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset('${widget.icone}'),
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
                    height: 500, // Ajuste conforme necessário
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(widget.descricao,
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  if(widget.titulo.toLowerCase() == "plástico")
                                    Table(
                                    border: TableBorder(
                                        horizontalInside:
                                            BorderSide(color: Colors.grey),
                                        bottom: BorderSide(color: Colors.grey)),
                                    columnWidths: {
                                      0: FixedColumnWidth(
                                          72.0), // Definindo a largura da primeira coluna
                                      1: FixedColumnWidth(
                                          54.0), // Definindo a largura da segunda coluna
                                      2: FixedColumnWidth(
                                          110.0), // Definindo a largura da terceira coluna
                                      3: FixedColumnWidth(
                                          134.0), // Definindo a largura da quarta coluna
                                    },
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent),
                                        children: [
                                          TableCell(
                                              child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Símbolo',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                    textAlign: TextAlign.center,
                                                  ))),
                                          TableCell(
                                              child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Sigla',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center),
                                          )),
                                          TableCell(
                                              child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Nome',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center),
                                          )),
                                          TableCell(
                                              child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Onde encontrar',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center),
                                          )),
                                        ],
                                      ),
                                      ...data.map((item) => TableRow(
                                                children: [
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        item['simbolo'] ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        item['sigla'] ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        item['nome'] ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                  TableCell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        item['onde'] ?? '',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    ],
                                  ),
                                ],
                              )
                              ),
                        ),
                        
                        SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(widget.descricao2,
                                      textAlign: TextAlign.justify),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  if(widget.titulo.toLowerCase() == "metal")
                                  Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Ferrosos", style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 10,),
              Table(
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.grey),
            top: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey)
          ),

          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Aço", textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
                )),
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Ferro Fundido", textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
                )),
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Aluminio", textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
                )),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("O processo de fabricação do aço envolve a fusão do minério de ferro e aditivos em altas temperaturas, seguido por processos de laminação, forjamento ou fundição para dar forma ao metal.", textAlign: TextAlign.center, style: TextStyle(),),
                )),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("O ferro fundido é produzido através da fundição do minério de ferro em moldes, seguido por processos de resfriamento e solidificação para formar as peças desejadas.", textAlign: TextAlign.center,))),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("O aluno é valorizado por sua resistência à corrosão, condutividade elétrica e facilidade de reciclagem, o que o torna uma escolha popular em muitas indústrias.", textAlign: TextAlign.center,))),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Encontrado em: Estruturas de edifícios, automóveis, utensílios de cozinha, ferramentas, etc.", textAlign: TextAlign.center, style: TextStyle(),),
                )),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("Encontrado em: Peças de máquinas, tubulações, gradeamento e grelhas, componentes de caldeiras, etc.", textAlign: TextAlign.center,))),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("Encontrado em: Embalagens, transporte, construção civil, eletrônicos, etc.", textAlign: TextAlign.center,))),
              ]
            ),
          ],
        ),
        SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Text("Não Ferrosos", style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 10,),
              Table(
          border: TableBorder(
               horizontalInside: BorderSide(
              color: Colors.grey),
            top: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey)
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Cobre", textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
                )),
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Metais Pesados", textAlign: TextAlign.center, style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 16
                ),),
                )),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Além de suas propriedades elétricas e térmicas, o cobre é valorizado por sua resistência à corrosão e sua capacidade de ser moldado em diversas formas.", textAlign: TextAlign.center, style: TextStyle(),),
                )),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("Embora alguns metais pesados sejam essenciais para processos biológicos em pequenas quantidades, a exposição excessiva a esses metais pode ser tóxica para os seres humanos e o meio ambiente, causando uma série de problemas de saúde, incluindo danos ao sistema nervoso, problemas renais e câncer.", textAlign: TextAlign.center,))),
              ]
            ),
            TableRow(
              children: [
                TableCell(child: Padding(padding: EdgeInsets.all(8.0),
                child: Text("Encontrado em: Fiação elétrica, tubulações, eletrônicos, moedas, jóias, etc.", textAlign: TextAlign.center, style: TextStyle(),),
                )),
                TableCell(child: Padding( padding: EdgeInsets.all(8.0), child: Text("Encontrado em: Alguns exemplos comuns de metais pesados incluem chumbo, mercúrio, cádmio e arsênio, etc.", textAlign: TextAlign.center,))),
              ]
            ),
          ],
        ),
            ],
          ),
        )
                                ],
                              )),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(widget.descricao3,
                                textAlign: TextAlign.justify),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(widget.descricao4,
                                textAlign: TextAlign.justify),
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
                          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Column(children: [
                            RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Veja as ideias feitas com ', // Texto fixo com estilo preto
                                  style: TextStyle(
                                    color: Colors.black, // Cor preta para o texto fixo
                                    fontFamily: 'Nunito',
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.titulo2, // Texto recebido com o estilo desejado
                                  style: TextStyle(
                                    color: widget.cor,
                                    fontFamily: 'Nunito',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold, // Negrito para o texto recebido
                                  ),
                                ),
                              ],
                            ),
                          )

                          ],),
                          ),

                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // DropdownButton de filtro (à esquerda agora)
                                ValueListenableBuilder(
                                  valueListenable: dropValue,
                                  builder: (BuildContext context, String value, _) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10), // Adiciona um padding ao redor do DropdownButton
                                      decoration: BoxDecoration(
                                        color: widget.cor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.filter_alt, color: Colors.white), // Ícone de filtro
                                          SizedBox(width: 8), // Espaçamento entre o ícone e o DropdownButton
                                          DropdownButton<String>(
                                            hint: Text("Ordenar", style: TextStyle(color: Colors.white),),
                                            value: (value.isEmpty) ? null : value,
                                            onChanged: (escolha) => dropValue.value = escolha.toString(),
                                            items: opcoes.map(
                                              (op) => DropdownMenuItem<String>(
                                                value: op,
                                                child: Text(op),
                                              ),
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                
                                SizedBox(width: 30), // Espaçamento entre o filtro e a pesquisa

                                SizedBox(
                                  width: 170,
                                  height: 35, 
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[500],
                                      hintText: 'Buscar',
                                      contentPadding: EdgeInsets.only(left: 15, bottom: 20, top: 5),
                                      suffixIcon: Container(
                                        decoration: BoxDecoration(
                                          color: widget.cor,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
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
                                        listaFiltrada = listaIdeias
                                            .where((idea) => idea.getTitulo
                                                .toLowerCase()
                                                .contains(text.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20), // Espaçamento abaixo da linha de pesquisa e filtro
                          ],
                        ),
                      ),




                          SizedBox(height: 30),
                          listaIdeias.isNotEmpty
                              ? Container(
                                  child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 12,
                                          mainAxisSpacing: 12,
                                          mainAxisExtent: 250),
                                  itemCount: numeroAndlistaFiltrado(),
                                  itemBuilder: (context, index) {
                                    return gerarCard(
                                        listaFiltrada[index].getTitulo,
                                        listaFiltrada[index].getImg,
                                        listaFiltrada[index].getDificuldade,
                                        listaFiltrada[index].getAvaliacao,
                                        listaFiltrada[index].getDesc,
                                        listaFiltrada[index].getPassoPasso,
                                        listaFiltrada[index].getAutor,
                                        listaFiltrada[index].getMateriais,
                                        listaFiltrada[index].getMaterial);
                                  },
                                ))
                              : Center(
                                  child: Text(
                                    "Sem posts no momento. Que tal postar alguma coisa?",
                                    style: TextStyle(fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          listaFiltrada.isEmpty
                              ? Center(
                                  child: Text(
                                    "Sem posts no momento. Que tal postar alguma coisa?",
                                    style: TextStyle(fontSize: 25),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
            WidgetBottomAppBar(scaffoldKey: _scaffoldKey)
          ],
        ));
  }

  int numeroAndlistaFiltrado() {
    int numero = 0;
    for (int i = 0; i < listaIdeias.length; i++) {
      if (listaIdeias[i].getMaterial.toLowerCase() ==
          widget.titulo.toLowerCase()) {
        numero++;
        listaFiltrada.add(listaIdeias[i]);
      }
    }
    return numero;
  }

  Widget gerarCard(
      String titulo,
      String imgUrl,
      Color dificuldade,
      int avaliacao,
      String desc,
      String passoPasso,
      String autor,
      List<String> listaMat,
      String material) {
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
                    Icon(Icons.circle, color: dificuldade),
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

void main() {
  runApp(MaterialApp(
    home:
        Tabbar("", Colors.transparent, "", "", "", "", "", "", "", "", "", ""),
  ));
}
