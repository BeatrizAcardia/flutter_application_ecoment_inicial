// ignore_for_file: unnecessary_this

import 'package:flutter_application_ecoment_inicial/models/Comentarios.dart';

class ComentarioRepository{
  List<Comentarios> listaComentarios = [];
  
  ComentarioRepository();

  List<Comentarios> get getListaComentarios => this.listaComentarios;

 set setListaComentarios(List<Comentarios> listaComentarios) => this.listaComentarios = listaComentarios;
}