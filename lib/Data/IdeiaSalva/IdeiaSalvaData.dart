import 'package:flutter_application_ecoment_inicial/Data/IdeiaSalva/GetIdeiaSalva.dart';
import 'package:flutter_application_ecoment_inicial/Data/IdeiaSalva/PostIdeiaSalva.dart';

class IdeiaSalvaData{
  late GetIdeiaSalva getIdeiaSalva;
  late PostIdeiaSalva postIdeiaSalva;

  IdeiaSalvaData(){
    this.getIdeiaSalva = GetIdeiaSalva();
    this.postIdeiaSalva = PostIdeiaSalva();
  }
}