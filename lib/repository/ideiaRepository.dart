import 'package:flutter_application_ecoment_inicial/models/ideia.dart';

class IdeiaRepository{
  List<Ideia> listaIdeias = [];
 
  IdeiaRepository();

  List<Ideia> get getListaIdeias => this.listaIdeias;

 set setListaIdeias(List<Ideia> listaIdeias) => this.listaIdeias = listaIdeias;
}