// ignore_for_file: unnecessary_this, non_constant_identifier_names

import 'package:flutter_application_ecoment_inicial/Data/Seguidor/GetSeguidor.dart';
import 'package:flutter_application_ecoment_inicial/Data/Seguidor/PostSeguidor.dart';

class Seguidor{
  late GetSeguidor getSeguidor;
  late PostSeguidor postSeguidor;

  Seguidor(){
    this.getSeguidor = GetSeguidor();
    this.postSeguidor = PostSeguidor();
  }
}