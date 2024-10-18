// ignore_for_file: unnecessary_this

import 'package:flutter_application_ecoment_inicial/Data/Curtida/GetCurtida.dart';
import 'package:flutter_application_ecoment_inicial/Data/Curtida/PostCurtida.dart';

class Curtida{
  late GetCurtida getCurtida;
  late PostCurtida postCurtida;

  Curtida(){
    this.getCurtida = GetCurtida();
    this.postCurtida = PostCurtida();
  }
}