// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, file_names, avoid_unnecessary_containers, avoid_function_literals_in_foreach_calls, unnecessary_import, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:br_validators/br_validators.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_ecoment_inicial/Controller/MapaController.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/appBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/bottomAppBar.dart';
import 'package:flutter_application_ecoment_inicial/defaultWidgets/drawer.dart';
import 'package:flutter_application_ecoment_inicial/models/Endereco.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:flutter_application_ecoment_inicial/views/minhaConta.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class PontosColeta extends StatefulWidget {
  const PontosColeta({super.key});

  @override
  State<PontosColeta> createState() => _PontosColetaState();
}

class _PontosColetaState extends State<PontosColeta> {
  //final controllerMapa = Get.put(MapaController());

  final ondacima = SizedBox(
    child: Image.asset('assets/imgs/ondamapa.png'),
  );

  final mapa = SizedBox(
    child: Image.asset('assets/imgs/mapa.png'),
  );

  TextEditingController cepController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double myLat = 0, myLong = 0;
  MapController mapController = MapController();

  List<Endereco> listaEnd = [
    Endereco(0, 0, "", "", "", ""),
    Endereco(
        -22.708023539710922,
        -47.367481737706875,
        "ECOPONTO - JARDIM DA PAZ",
        "Centro de reciclagem",
        "R. Estevão Carlos Vicentini, 175 - Jardim da paz, Americana - SP, 13469-804",
        "seg-sex 07:00-17:00 \n sáb 08:00-16:00"),
    Endereco(
        -22.753604569375707,
        -47.30979351764844,
        "ECOPONTO - INDUSTRIAL WERNER PLAAS",
        "Depósito",
        "R. do Mecânico, 35 - Jardim Werner Plaas, Americana - SP, 13479",
        "seg-sex 07:00-17:00 \n sáb 08:00-12:00"),
    Endereco(
        -22.71127111707305,
        -47.321384028889874,
        "ECOPONTO - NOVA CARIOBA",
        "Centro de reciclagem",
        "R. José Nicoleti, 110 - Parque Nova Carioba, Americana - SP, 13473-756",
        "seg-sex 07:00-17:00 \n sáb 08:00-12:00"),
    Endereco(
        -22.766306643658144,
        -47.326258564471985,
        "ECOPONTO - JARDIM DOS LÍRIOS",
        "Centro de reciclagem",
        "R. das Seriemas, 550 - Vila Mathiesen, Americana - SP, 13467-310",
        "seg-sex 07:00-18:00 \n sáb 08:00-17:00 \n dom 08:00–12:00"),
    Endereco(
        -22.73251215321659,
        -47.35166863162096,
        "Ecoponto - Catharina Zanaga",
        "Centro de reciclagem",
        "Av. Carminé Feola, 1327 - Catharina Zanaga, Americana - SP, 13469-360",
        "seg-sex 07:00-17:00 \n sáb 08:00-17:00"),
    Endereco(
        -22.754585078966517,
        -47.320598802418026,
        "Excelente sustentabilidade",
        "Centro de reciclagem",
        "R. Tibiriçá, 1517 - Conserva, Americana - SP, 13466-044",
        "seg-sex 08:00-18:00 \n sáb 08:30-13:00"),
    Endereco(
        -22.741716171418936,
        -47.279087186786825,
        "ECOPONTO JARDIM BOER - JARDIM BERTONI",
        "Centro de reciclagem",
        "Av. Roma, 4347-4499 - Jardim Mirandola, Americana - SP, 13478-860",
        "seg-sex 07:00-17:00 \n sáb 08:00-17:00 \n dom 08:00–12:00"),
    Endereco(
        -22.698619907189443,
        -47.30384633283686,
        "Eco Parque - Descarte de materiais descartáveis",
        "Cooperativa",
        "Lot. Industrial Salto Grande II, Americana - SP, 13474-760",
        "--"),
    Endereco(
        -22.69843026922708,
        -47.3047846744341,
        "ECOPONTO - ANTONIO ZANAGA",
        "Centro de reciclagem",
        "Av. do Raion Viscose, 209 - Lot. Industrial Salto Grande I, Americana - SP, 13474-760",
        "seg-sex 07:00–17:00 \n sáb 08:00–17:00"),
    Endereco(
        -22.733249947638157,
        -47.39325330737262,
        "Ecoponto Planalto do Sol II",
        "Centro de reciclagem",
        "Av. Barretos - Frezzarin 2, Santa Bárbara d'Oeste - SP, 13453-830",
        "seg-dom 06:00–11:00 e 12:30–18:00"),
    Endereco(
        -22.76047925318925,
        -47.372482281274586,
        "Ecoponto Jardim Gerivá",
        "Centro de reciclagem",
        "Av. Juscelino K. de Oliveira - Mollon, Santa Bárbara d'Oeste - SP",
        "seg-dom 06:00–11:00 e 12:30–18:00"),
    Endereco(
        -22.76522799486505,
        -47.412736873175305,
        "Ecoponto Parque Olaria",
        "Centro de reciclagem",
        "R. Independência - Parque Olaria, Santa Bárbara d'Oeste - SP, 13458-020",
        "seg-dom 06:00–11:00 e 12:30–18:00"),
    Endereco(
        -22.73028809480422,
        -47.35987639764068,
        "Eco Drive Thru - Jardim das Palmeiras",
        "Centro de reciclagem",
        "R. Ver. Francisco Cruz, 272-294 - Jardim Cândido Bertini, Santa Bárbara d'Oeste - SP, 13455-169",
        "Atendimento 24 horas"),
    Endereco(
        -22.81134231790239,
        -47.3061424503688,
        "Ecoponto Nova Odessa",
        "Centro de reciclagem",
        "Rua Vilhelms Rosenbergs, s/n - Jardim Monte das Oliveiras, Nova Odessa - SP, 13460-000",
        "seg-dom 07:00–19:00"),
    Endereco(
        -22.78309442121531,
        -47.282367350248336,
        "Ecoponto Triunfo - Nova Odessa",
        "Centro de reciclagem",
        "Av. Frederico Hansen, 263 - Nucleo Res. Triunfo, Nova Odessa - SP, 13460-000",
        "seg-dom 07:00–19:00"),
    Endereco(
        -22.612606523264837,
        -47.06134913439375,
        "Ecoponto Imigrantes Holambra",
        "Centro de reciclagem",
        "R. Scheltinga, Holambra - SP, 13825-000",
        "seg-sab 07:45–16:00"),
    Endereco(
        -22.60945358896974,
        -47.0373141452932,
        "Adiaesp UREV Holambra",
        "Centro de reciclagem",
        "9XR7+23, Holambra - SP, 13825-000",
        "seg-sex 08:00-12:00 e 13:00-16:30"),
    Endereco(
        -23.00434151197565,
        -46.82374923558183,
        "Ecoponto Jardim Vitória",
        "Centro de reciclagem",
        "Tv. Idalina Leardine, 1 - Jardim México, Itatiba - SP, 13253-412",
        "seg-sex 08:00–11:30 e 13:00–17:30 \n sab 08:00-12:00"),
    Endereco(
        -23.007213905063043,
        -46.81764711141134,
        "Ecoponto San Francisco",
        "Centro de reciclagem",
        "Av. Neide Vieira de Almeida Barbosa, 501 - Parque São Francisco, Itatiba - SP",
        "Permanentemente fechado"),
    Endereco(
        -22.992060684671607,
        -46.826782793891006,
        "Ecoponto Jardim Novo Horizonte",
        "Centro de reciclagem",
        "R. Luiz Jarussi, 1000 - Vila Santa Cruz, Itatiba - SP, 13251-500",
        "seg-sex 08:00–11:30 e 13:00–17:30 \n sab 08:00-12:00"),
    Endereco(
        -23.024626225007122,
        -46.853519717778056,
        "Ecoponto N.R. Porto Seguro",
        "Centro de reciclagem",
        "Av. Urbâno Bezana, 250 - Núcleo Res. Porto Seguro, Itatiba - SP, 13255-650",
        "seg-sex 08:00–11:30 e 13:00–17:30 \n sab 08:00-12:00"),
    Endereco(
        -23.009648468799806,
        -46.86395303558184,
        "Ecoponto Jardim das Nações",
        "Centro de reciclagem",
        "Avenida Vicente Catalani, nº 1685 - Jardim Nações, Itatiba - SP, 13256-700",
        "seg-sex 08:00–11:30 e 13:00–17:30 \n sab 08:00-12:00"),
    Endereco(
        -22.98064137744257,
        -46.83526682684297,
        "Ponte Reciclagem Ltda.",
        "Centro de reciclagem",
        "Avenida Idalina Tescarollo Sanfins, 70 - Bairro da Ponte, Itatiba - SP, 13251-714",
        "seg-sex 07:10–12:00 \n 13:00–17:00"),
    Endereco(
        -23.02223994157546,
        -46.789590119648246,
        "Cooperativa Reviver",
        "Cooperativa",
        "Estrada Municipal Benedicto Antonio Ragagnim S/N - Bairro dos Pintos, Itatiba SP, 13254-741",
        "--"),
    Endereco(
        -22.685278803090675,
        -46.98481317525706,
        "Ecoponto 01 - Santa Mercedes",
        "Centro de reciclagem",
        "Jardim Novo Horizonte, Jaguariúna - SP, 13820-000",
        "seg-sab 07:40–16:00"),
    Endereco(
        -22.668951429037783,
        -46.98125524401432,
        "Cooperativa",
        "Cooperativa",
        "Av. Pacífico Moneda, 1051, Jaguariúna - SP, 13820-000",
        "seg-sab 07:00–16:45"),
    Endereco(-22.664071164287044, -46.902941353139454, "Ecoponto",
        "Centro de reciclagem", "R. do Trab., Pedreira - SP, 13920-000", "--"),
    Endereco(
        -22.988500220228048,
        -46.97662209124274,
        "ECOPONTO VALINHOS",
        "Centro de reciclagem",
        "R. João Bissoto Filho, 2245 - Dos Ortizes, Valinhos - SP, 13274-465",
        "seg-sab 7:45-16:00"),
    Endereco(
        -22.9445611314215,
        -46.99644897951441,
        "ECOPONTO 02 - QUINTAL",
        "Depósito",
        "R. Antônio Cremasco, 165 - Samambaia, Valinhos - SP, 13274-465",
        "seg-sab 7:45-16:00"),
    Endereco(
        -22.979112183126198,
        -46.9886150493729,
        "SANTA CLARA RECICLÁVEIS",
        "Depósito",
        "Av. Rosa Belmiro Ramos, 225 - Ortizes, Valinhos - SP, 13275-400",
        "--"),
    Endereco(
        -23.03666460008554,
        -47.00109111673981,
        "Fidélis Ambiental",
        "Centro de reciclagem",
        "R. Arnaldo Roque Brisque, 472 - Altos do Morumbi, Vinhedo - SP, 13280-000",
        "seg-sex 7:00-17:00 \n sab 7:00-12:00"),
    Endereco(
        -23.01212555320797,
        -46.975667116740276,
        "Ferro Plaspel",
        "Centro de reciclagem",
        "R. Rancho Fundo, 209 - Vila Pompéia, Vinhedo - SP, 13283-182",
        "seg-sex 7:00-17:00"),
    Endereco(
        -22.54465920794545,
        -47.404028976274034,
        "Ecoponto - Anavec",
        "Centro de reciclagem",
        "R. Prof. Otávio Pimenta Réis - Vila Rosana, Limeira - SP, 13485-130",
        "seg-sab 7:30-18:00 <br> dom 7:30-12:00"),
    Endereco(
        -22.571453167201227,
        -47.393858162780845,
        "Ecoponto - Marginal Tatu",
        "Centro de reciclagem",
        "R. Antônio Lucato, 1883-1931 - Vila Camargo, Limeira - SP",
        "seg-sex 7:30-17:00 <br> sab 7:30-12:00"),
    Endereco(
        -22.607104208205104,
        -47.408179430242235,
        "Ecoponto - Santa Eulália",
        "Centro de reciclagem",
        "R. Prof. Dr. Antônio Prince Rodrigues - Jardim Santa Eulália, Limeira - SP, 13481-138",
        "seg-sex 7:30-18:00 <br> sab 8:00-12:00"),
    Endereco(
        -22.616251233899582,
        -47.41253594558551,
        "Ecoponto - Lagoa Nova",
        "Centro de reciclagem",
        "Av. Dr. Antônio de Luna, 1269 - Parque Res. Aeroporto, Limeira - SP",
        "seg-sex 8:00-17:00 <br> sab 8:00-11:00"),
    Endereco(
        -22.576559032908232,
        -47.37445935907894,
        "Ecoponto - Barão de Limeira",
        "Centro de reciclagem",
        "Tv. Assembléia de Deus - Jardim Barao de Limeira, Limeira - SP, 13487-011",
        "--"),
    Endereco(
        -22.574684577695873,
        -47.45353701675041,
        "Ecoponto - Águas da Serra",
        "Centro de reciclagem",
        "R. Prof. Ari Pereira Souto, 390 - Jardim Res. Village, Limeira - SP, 13482-713",
        "--"),
    Endereco(
        -22.554992031900305,
        -47.450210160930276,
        "Ecoponto - Belinha Ometto",
        "Centro de reciclagem",
        "Parque Res. Belinha Ometto, Limeira - SP, 13483-283",
        "--"),
    Endereco(
        -22.78454065461162,
        -47.20458244373045,
        "Cooperlínia Ambiental do Brasil - Cooperativa de Profissionais da Área de Reciclagem do Brasil",
        "Centro de reciclagem",
        "Av. Orlando Vedovello, s/nr - Parque da Represa, Paulínia - SP, 13140-610",
        "seg-sex 7:00-17:00"),
    Endereco(
        -22.766424298152057,
        -47.115658832089416,
        "Inova Ambiental - Recicláveis e Resíduos em Geral",
        "Centro de reciclagem",
        "Av. Constante Pavan, 4244 - Betel, Paulínia - SP, 13148-198",
        "seg-sex 8:00-17:30"),
    Endereco(
        -22.85535825835602,
        -46.78734356223525,
        "Cooperativa Renascer",
        "Centro de reciclagem",
        "R. São Benedito, 1157-1159, Morungaba - SP, 13260-000",
        "seg-sab 7:00-17:00"),
    Endereco(
        -23.105658432752996,
        -47.241055387988915,
        "Ecoponto João Pioli",
        "Centro de reciclagem",
        "Av. Artes e Ofícios - Conj. Hab. Joao Pioli, Indaiatuba - SP, 13348-635",
        "seg-dom 7:00-19:00"),
    Endereco(
        -23.104410039940305,
        -47.20734669509648,
        "Ecoponto Quintal - Jardim Eldorado",
        "Centro de reciclagem",
        "R. Rev. Eliseu Narciso, 709 - Jardim Eldorado, Indaiatuba - SP, 13343-800",
        "seg-dom 7:00-19:00"),
    Endereco(
        -23.094945065504607,
        -47.24947584531843,
        "Ecoponto Jardim Nova Veneza",
        "Centro de reciclagem",
        "R. José Vilalta, 51, Indaiatuba - SP, 13348-771",
        "seg-dom 7:00-19:00"),
    Endereco(
        -23.076520916416666,
        -47.19355879198313,
        "Ecoponto - Jardim Olinda",
        "Centro de reciclagem",
        "R. Valdir Ferrari, 104 - Jardim Olinda, Indaiatuba - SP, 13335-560",
        "seg-dom 7:00-19:00"),
    Endereco(
        -23.081564188058973,
        -47.20317689311274,
        "Ilha Ecológica - Descarte de Recicláveis",
        "Centro de reciclagem",
        "R. Armando Salles de Oliveira, 1735 - Cidade Nova I, Indaiatuba - SP, 13334-160",
        "--"),
    Endereco(
        -23.096091995487463,
        -47.21313325278246,
        "Ilha Ecológica - Descarte de Recicláveis",
        "Centro de reciclagem",
        "R. Alexandre Ratti - Vila Brizzola, Indaiatuba - SP, 13343-450",
        "Aberto 24 horas"),
    Endereco(
        -23.06956177164261,
        -47.227896130913436,
        "Ilha Ecológica - Descarte de Recicláveis",
        "Centro de reciclagem",
        "R. Lisboa, s/n - Jardim Europa, Indaiatuba - SP, 13331-065",
        "--"),
    Endereco(
        -22.817111872461293,
        -47.10034972443041,
        "ECOPONTO - BARÃO GERALDO",
        "Centro de reciclagem",
        "Avenida Santa Isabel, 2.300 - Distrito de Barão Geraldo, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.872545785680227,
        -47.04119242678905,
        "PONTO VERDE - CARLOS GRIMALDI",
        "Centro de reciclagem",
        "Rua Cōnego Pedro Bonhomme, 2.424 - Jardim Bela Vista, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.898002173836993,
        -47.04264358401872,
        "ECOPONTO - CAMPOS SALLES",
        "Centro de reciclagem",
        "Avenida São José dos Campos, s/n - Campos Sales, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.909616202555224,
        -47.067778824556335,
        "ECOPONTO - CENTRO",
        "Centro de reciclagem",
        "Rua Antônio Manuel, 2 - Vila Industrial, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.891582906785985,
        -47.100859150927164,
        "ECOPONTO - JARDIM EULINA",
        "Centro de reciclagem",
        "Avenida Marechal Rondon, esquina com a rua José Manuel Veiga - Jardim Chapadão, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.93767525779135,
        -47.19707469357003,
        "ECOPONTO - JARDIM ITAJAÍ",
        "Centro de reciclagem",
        "Rua Celso Soares Couto, s/n - Parque Itajaí, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -23.035802513904763,
        -47.11009366725249,
        "ECOPONTO - JARDIM MARISA",
        "Centro de reciclagem",
        "Rua Orlando Bortoletti, 217 - Jardim Marisa, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.904371627014125,
        -47.10555105092718,
        "ECOPONTO - JARDIM PACAEMBU",
        "Centro de reciclagem",
        "Rua Dante Suriani, 2.382 - Chácara Cneo, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.881511100342973,
        -47.125293553344584,
        "ECOPONTO - PARQUE VIA NORTE",
        "Centro de reciclagem",
        "Rua dos Cambarás, 200 - Vila Boa Vista, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.94188822826917,
        -47.03044362360441,
        "ECOPONTO - JARDIM SÃO GABRIEL",
        "Centro de reciclagem",
        "Rua José Martins Lourenço, 140 - Jardim São Gabriel, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.895851011492663,
        -47.156349835581835,
        "ECOPONTO - PARQUE SÃO JORGE",
        "Centro de reciclagem",
        "Rua Plácida Pretini, 196-270 - Parque São Jorge, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.888904030768614,
        -46.979755706745486,
        "ECOPONTO - SOUSAS",
        "Centro de reciclagem",
        "Avenida Dona Júlia Conceição Alves, 1.134 - Distrito de Sousas, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.977051982028105,
        -47.17783417790916,
        "ECOPONTO - VIDA NOVA",
        "Centro de reciclagem",
        "Rua Lídia Martins de Assis, s/n - Bairro Vida Nova, Campinas - SP",
        "Diariamente, exceto feriados, 07:00-19:00"),
    Endereco(
        -22.936034529574382,
        -47.11856763558183,
        "ECOPONTO - VILA UNIÃO",
        "Centro de reciclagem",
        "Rua Manoel Gomes Ferreira, 42 - Parque Tropical, Campinas - SP",
        "07:00-19:00"),
    Endereco(
        -22.91461800428991,
        -47.07127963913793,
        "ECOPONTO - VILA RIALTO (PARQUE ITÁLIA) - EXCLUSIVO PARA PNEUS",
        "Centro de reciclagem",
        "Avenida Prefeito Faria Lima, 630 - Jardim Rialto, Campinas - SP",
        "Seg-Sex 07:00-11:00, 12:00-16:00"),
    Endereco(
        -22.908045932939352,
        -47.03641981283953,
        "Ecoponto Paranapanema",
        "Centro de reciclagem",
        "Rua Serra d'Água, 427 - Jardim Baroneza, Campinas - SP, 13100-335",
        "07:00-11:00, 12:00-18:00"),
    Endereco(
        -22.724138010240814,
        -47.317061140519165,
        "COOPERATIVA ALIANÇA",
        "Cooperativa",
        "Rua São Simão, 536 - Vila Olímpia, Campinas - SP",
        "--"),
    Endereco(
        -22.932941511349046,
        -47.15645795185942,
        "COOPERATIVA ANTÔNIO DA COSTA SANTOS",
        "Cooperativa",
        "Av. Dra. Zilda Arns Neumann, 3042 - Cidade Satélite Íris, Campinas - SP, 13059-643",
        "--"),
    Endereco(
        -22.87728483956757,
        -47.14128570818977,
        "COOPERATIVA BOM SUCESSO",
        "Cooperativa",
        "Rua Engenheiro Geraldo Calcagnolo, 06 - Vila Régio, Campinas - SP",
        "--"),
    Endereco(
        -22.914622669583558,
        -47.04063905979054,
        "COOPERATIVA NOSSA SENHORA APARECIDA",
        "Cooperativa",
        "Rua Alaíde Nascimento de Lemos, 300 - Vila Lemos, Campinas - SP",
        "--"),
    Endereco(
        -22.881444304154712,
        -47.12473307515364,
        "COOPERATIVA HAVILÁ",
        "Cooperativa",
        "Rua dos Cambarás, 670 - Bairro Parque Via Norte, Campinas - SP",
        "--"),
    Endereco(
        -22.943455244846003,
        -47.08604659046875,
        "COOPERATIVA REMODELA",
        "Cooperativa",
        "R. Otávio Bianchi Zulo, 207 - Jardim do Lago, Campinas - SP, 13051-033",
        "--"),
    Endereco(
        -22.931607136074962,
        -47.115467131490355,
        "COOPERATIVA RENASCER",
        "Cooperativa",
        "Rua Madre Tereza de Calcutá, 365 - Jardim Santa Lucia, Campinas - SP",
        "--"),
    Endereco(
        -22.851887745454153,
        -47.07477845189996,
        "COOPERATIVA SANTA GENEBRA",
        "Cooperativa",
        "Rua Estácio de Sá, 577 - Bairro Santa Genebra, Campinas - SP",
        "--"),
    Endereco(
        -22.91576967533622,
        -47.10635138134789,
        "COOPERATIVA SANTO EXPEDITO",
        "Cooperativa",
        "Rua Basílio da Gama, 101 - Vila Presidente Castelo Branco, Campinas - SP",
        "--"),
    Endereco(
        -22.914620649531678,
        -47.07117154907197,
        "COOPERATIVA SÃO BERNARDO",
        "Cooperativa",
        "Avenida Prefeito Faria Lima, 630 - Bairro São Bernardo, Campinas - SP",
        "--"),
    Endereco(
        -22.931341198752147,
        -47.15176726447705,
        "NÚCLEO ANTÔNIO DA COSTA SANTOS",
        "Cooperativa",
        "Rua Dr. Lázaro Pinto Barroso, 700 - Bairro São Caetano, Campinas - SP",
        "--"),
    Endereco(
        -22.84840863501458,
        -47.10518466724792,
        "COOPERATIVA UNIDOS NA VITÓRIA",
        "Cooperativa",
        "Rodovia D. Pedro I, km 140,5 - CEASA Campinas, Campinas - SP",
        "--"),
    Endereco(
        -22.957724414459065,
        -47.19904104750593,
        "COOPERBASSOLI",
        "Cooperativa",
        "Rua Wilson Romero, 56 - Conjunto Residencial Parque São Bento, Campinas - SP",
        "--"),
    Endereco(
        -22.909738688510622,
        -47.05727335929543,
        "RECICLAMP",
        "Cooperativa",
        "Rua Barão de Jaguara, 297 - Centro, Campinas - SP, 13015-000",
        "--"),
    Endereco(
        -22.852900825905646,
        -47.20777858811985,
        "PEV 1 - AUXILIADORA",
        "Ponto de entrega voluntária",
        "Rua Antônio João de Amorim, esquina com a rua Sebastiana Oliveira da Silva, Hortolândia - SP",
        "--"),
    Endereco(
        -22.905625047907424,
        -47.18017535910545,
        "PEV 2 - ADELAIDE",
        "Ponto de entrega voluntária",
        "Rua Paulo Roberto Soares (antiga rua 9), esquina com a Rua Benedito Macedo, Hortolândia - SP",
        "--"),
    Endereco(
        -22.889706619394943,
        -47.20844467646988,
        "PEV 4 - JARDIM INTERLAGOS",
        "Ponto de entrega voluntária",
        "Rua Rio Tapajós (antiga rua 5), Hortolândia - SP",
        "--"),
    Endereco(
        -22.85608393352047,
        -47.2193551746249,
        "PEV 5 - VILA REAL",
        "Ponto de entrega voluntária",
        "Rua Orlando Cavalcante, esquina com a Rua Joaquim Gregório de Moraes, Hortolândia - SP",
        "--"),
    Endereco(
        -22.89686785696937,
        -47.23777638032063,
        "PEV 6 - AMANDA",
        "Ponto de entrega voluntária",
        "Rua Augusto dos Anjos, Hortolândia - SP",
        "--"),
    Endereco(
        -22.841788418983846,
        -47.22211240608572,
        "PEV 7 - ORESTES ÔNGARO",
        "Ponto de entrega voluntária",
        "Rua Rio Pardo (antiga rua 13), 50, dentro do Aterro de Inertes, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86029639112228,
        -47.16356387835405,
        "PEV 8 - SANTIAGO",
        "Ponto de entrega voluntária",
        "Rua João Joaquim Calixto, 230, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86026262087091,
        -47.163571861130286,
        "PEV 9 - FÁTIMA",
        "Ponto de entrega voluntária",
        "Rua Manoel Antônio da Silva, 610, Hortolândia - SP",
        "--"),
    Endereco(
        -22.888665096177228,
        -47.173345649566095,
        "PEV 10 - SANTA EMÍLIA",
        "Ponto de entrega voluntária",
        "Rua Luísa Febrônio Marini, Hortolândia - SP",
        "--"),
    Endereco(
        -22.888527386252797,
        -47.17332231695412,
        "PEV 11 - SANTA ESMERALDA",
        "Ponto de entrega voluntária",
        "Rua Ágata, Hortolândia - SP",
        "--"),
    Endereco(
        -22.88016204051199,
        -47.2078161746244,
        "PEV 12 - NOVA ALVORADA",
        "Ponto de entrega voluntária",
        "Rua Alcebíades Marques, 15 (antiga rua 5), próxima ao Parque Socioambiental Lago da Fé, Hortolândia - SP",
        "--"),
    Endereco(
        -22.88976291129142,
        -47.21934234665405,
        "PEV 13 - SÃO SEBASTIÃO",
        "Ponto de entrega voluntária",
        "R. Professor Lúcio Alves da Costa (praça 2), no Loteamento Adventista Campineiro, próximo à AMCRESS, Hortolândia - SP",
        "--"),
    Endereco(
        -22.87509210915685,
        -47.225194503459974,
        "LEV - Pq. Hortolândia",
        "Local de entrega voluntária/Lixeira",
        "Praça Vereador José Costa Camargo, na Rua Pastor Germano Ritter, próximo à Sabesp, Hortolândia - SP",
        "--"),
    Endereco(
        -22.874898183769528,
        -47.233498116954536,
        "LEV - Jd. Firenze",
        "Local de entrega voluntária/Lixeira",
        "Rua Veneza, perto do fórum, Hortolândia - SP",
        "--"),
    Endereco(
        -22.893928714192292,
        -47.2376195865052,
        "LEV - Amanda - Rua Tiradentes",
        "Local de entrega voluntária/Lixeira",
        "Rua Tiradentes em frente à Lagoa, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86609168514736,
        -47.22164664517193,
        "LEV - Parque Chico Mendes",
        "Local de entrega voluntária/Lixeira",
        "Rua João Mendes, s/n, Parque Ortolândia, Hortolândia - SP",
        "--"),
    Endereco(
        -22.878708970501712,
        -47.20208847462424,
        "LEV - Jardim Everest",
        "Local de entrega voluntária/Lixeira",
        "Rua Pico do Itatiaia, em frente ao número 88, Hortolândia - SP",
        "--"),
    Endereco(
        -22.881711448946195,
        -47.2130876016141,
        "LEV - Lago da Fé",
        "Local de entrega voluntária/Lixeira",
        "Av. Wesley Dias Rodrigues, no Jd. Nova Alvorada, Hortolândia - SP",
        "--"),
    Endereco(
        -22.8586165930295,
        -47.22141498627429,
        "LEV - Vila Real",
        "Local de entrega voluntária/Lixeira",
        "Av. São Francisco de Assis, na Praça da Paróquia N. Senhora do Rosário, Hortolândia - SP",
        "--"),
    Endereco(
        -22.907139613802904,
        -47.19170841695383,
        "LEV - Jd. Santa Esmeralda",
        "Local de entrega voluntária/Lixeira",
        "Rua Turmalina, em frente à Emei Jd. Santa Esmeralda, Hortolândia - SP",
        "--"),
    Endereco(
        -22.894978779263415,
        -47.165538545789346,
        "LEV - Jd. Nossa Senhora de Fátima - Praça do Doceiro",
        "Local de entrega voluntária/Lixeira",
        "Rua Cícero Ramos Meira, na “Praça do Doceiro”, Hortolândia - SP",
        "--"),
    Endereco(
        -22.89364514443017,
        -47.16270948811912,
        "LEV - Jd. Nossa Senhora de Fátima - Rua Albina Rodrigues Pereira",
        "Local de entrega voluntária/Lixeira",
        "Rua Albina Rodrigues Pereira, s/n, Hortolândia - SP",
        "--"),
    Endereco(
        -22.897203079261796,
        -47.16880737462403,
        "LEV - Jd. Nossa Senhora de Fátima - Emeb Josias da Silva Macedo",
        "Local de entrega voluntária/Lixeira",
        "Rua Armelinda Espúrio da Silva, 785 (dentro da Emeb Josias da Silva Macedo), Hortolândia - SP",
        "--"),
    Endereco(
        -22.88985102341896,
        -47.22173291879983,
        "LEV - São Sebastião (metálico)",
        "Local de entrega voluntária/Lixeira",
        "Rua Pastor Ernesto Roth, 705, Lot. Adventista Campineiro, divisa com Residencial São Sebastião, Hortolândia - SP",
        "--"),
    Endereco(
        -22.878726979274777,
        -47.25841798996479,
        "LEV - Jd. Novo Horizonte",
        "Local de entrega voluntária/Lixeira",
        "Rua Moacir de Souza Campos, em frente à escola Emef Taquara Branca, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86987795076951,
        -47.21812203680663,
        "LEV - Palácio das Águas",
        "Local de entrega voluntária/Lixeira",
        "Rua José Cláudio Alves dos Santos, 585 – Remanso Campineiro, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86986820840017,
        -47.21813273229497,
        "LEV - Câmara Municipal",
        "Local de entrega voluntária/Lixeira",
        "Rua Joseph Paul Julien Burlandy, 250, Parque Gabriel, Hortolândia - SP",
        "--"),
    Endereco(
        -22.864406891786942,
        -47.214745989965095,
        "LEV - Região Central",
        "Local de entrega voluntária/Lixeira",
        "Rua Luiz Camilo de Camargo, 630, Remanso Campineiro ao lado da Casa Bahia, Hortolândia - SP",
        "--"),
    Endereco(
        -22.866565222241977,
        -47.21251480346014,
        "LEV - Bambino",
        "Local de entrega voluntária/Lixeira",
        "Rua Alda Lourenço, em frente ao número 221, Remanso Campineiro, Hortolândia - SP",
        "--"),
    Endereco(
        -22.88775066964837,
        -47.23673058996474,
        "LEV - Amanda - E. E. Priscila Fernandes da Rocha",
        "Local de entrega voluntária/Lixeira",
        "Rua Santos Dumont, Jardim Amanda, Hortolândia - SP",
        "--"),
    Endereco(
        -22.898466397860258,
        -47.2423477720549,
        "LEV - Amanda - E.E Prof. Conceição Aparecida Tereza Gomes Cardinales",
        "Local de entrega voluntária/Lixeira",
        "Rua Visconde do Rio Branco, Jardim Amanda, Hortolândia - SP",
        "--"),
    Endereco(
        -22.898381812364732,
        -47.2422440592839,
        "LEV - Remanso das Águas",
        "Local de entrega voluntária/Lixeira",
        "Avenida Sabina Batista de Camargo, (perto do quiosque), Hortolândia - SP",
        "--"),
    Endereco(
        -22.891858676237725,
        -47.198213788119105,
        "LEV - Jardim Santa Clara",
        "Local de entrega voluntária/Lixeira",
        "Rua Bolívia ao lado do CREAPE, em frente a Emef Viva Mais, Hortolândia - SP",
        "--"),
    Endereco(
        -22.84133842924215,
        -47.21864033045016,
        "LEV - Orestes Ôngaro",
        "Local de entrega voluntária/Lixeira",
        "R. Domingos Batista de Souza, em frente ao quiosque, Hortolândia - SP",
        "--"),
    Endereco(
        -22.88597321073364,
        -47.166611788119404,
        "LEV - Jardim Malta",
        "Local de entrega voluntária/Lixeira",
        "Rua das Rosas, 137, Hortolândia - SP",
        "--"),
    Endereco(
        -22.907341231121908,
        -47.17748571695401,
        "LEV - Adelaide",
        "Local de entrega voluntária/Lixeira",
        "Praça situada na Rua Benedito Pedro Lacerda, altura do número 215, Hortolândia - SP",
        "--"),
    Endereco(
        -22.88361802383259,
        -47.22184839975006,
        "LEV - Jd. Novo Cambuí",
        "Local de entrega voluntária/Lixeira",
        "Emei Jardim Novo Cambuí, Rua Professor Timóteo Mendes de Oliveira, Hortolândia - SP",
        "--"),
    Endereco(
        -22.892542936928802,
        -47.174650461700885,
        "LEV - Rosolém",
        "Local de entrega voluntária/Lixeira",
        "Praça A Poderosa, Hortolândia - SP",
        "--"),
    Endereco(
        -22.86778781993829,
        -47.22593550902571,
        "LEV - Terminal Metropolitano de Hortolândia",
        "Local de entrega voluntária/Lixeira",
        "Avenida Santana (próximo ao MC Donald’s), Hortolândia - SP",
        "--"),
    Endereco(
        -22.863626690936005,
        -47.19950146113018,
        "LEV - Jd. Minda",
        "Local de entrega voluntária/Lixeira",
        "Praça da Emei Jd. Minda, Rua Gisele França Gomes, altura do número 205, Hortolândia - SP",
        "--"),
    Endereco(
        -22.854645200382908,
        -47.21103606297576,
        "LEV - UPA Nova Hortolândia",
        "Local de entrega voluntária/Lixeira",
        "Rua José Martim dos Anjos, 185, Hortolândia - SP",
        "--"),
    Endereco(
        -22.902542282507678,
        -47.18297006064131,
        "LEV - Terras de Santo Antônio",
        "Local de entrega voluntária/Lixeira",
        "Praça localizada na Rua Um, Hortolândia - SP",
        "--"),
    Endereco(
        -22.904811941317476,
        -47.21081706112927,
        "LEV - UBS Jardim São Bento",
        "Local de entrega voluntária/Lixeira",
        "Rua do Cartola, Jardim São Bento, Hortolândia - SP",
        "--"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: WidgetDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ondacima,
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: cepController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        hintText: 'CEP, endereço ou coordenadas',
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
                          child: IconButton(
                            onPressed: () => buscar(cepController.text),
                            icon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (value) => buscar(cepController.text),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            height: 400,
                            child: Maps(listaEnd),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WidgetBottomAppBar(scaffoldKey: _scaffoldKey),
    );
  }

  Future<void> buscar(String cep) async {
    if (cep == "") {
      mapController.move(LatLng(-22.8161490, -47.0686510), 10.0);
      setState(() {});
    } else {
      var url = Uri.parse(
          "https://api.distancematrix.ai/maps/api/geocode/json?address=${cep}&key=BWxx9qPxW8xHiGX9ZWx6iVYAAOCcJpbvXeKc8Zt9ryPoZgnuvKTcNODv8O17V5oM");
      http.Response response;
      response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          Map<String, dynamic> dadosFormatados = jsonDecode(response.body);
          myLat = (dadosFormatados['result'][0]['geometry']['location']['lat']);
          myLong =
              (dadosFormatados['result'][0]['geometry']['location']['lng']);
          print("Latitude: " + myLat.toString());
          print("\nLongitude: " + myLong.toString());
          listaEnd[0].lat = myLat;
          listaEnd[0].long = myLong;
          listaEnd[0].adress =
              (dadosFormatados['result'][0]['formatted_address']);
          listaEnd[0].title = "EU";
          mapController.move(LatLng(myLat, myLong), 13.0);
        });
      }
    }
  }

  Widget Maps(List<Endereco> lista) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter:
            LatLng(-22.8161490, -47.0686510), // Define o centro do mapa
        initialZoom: 10,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
          maxNativeZoom: 19,
        ),
        MarkerLayer(
          markers: lista.map((endereco) {
            return Marker(
              point: LatLng(endereco.lat,
                  endereco.long), // Pega as coordenadas do endereço
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('${endereco.title}'), // Nome do ecoponto
                    content: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Tipo: ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: endereco.type,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: '\nLocalizado em:\n',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: endereco.adress,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: '\nHorário:\n',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          TextSpan(
                            text: endereco.time,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('Fechar'),
                        onPressed: () => Navigator.pop(context, 'OK'),
                      ),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.location_pin,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            );
          }).toList(), // Gera a lista de marcadores
        ),
      ],
    );
  }
}
