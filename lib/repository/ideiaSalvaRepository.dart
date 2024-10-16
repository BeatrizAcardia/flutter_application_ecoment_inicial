import 'package:flutter_application_ecoment_inicial/models/ideiaSalva.dart';

class IdeiaSalvaRepository{
  List<IdeiaSalva> listaIdeiaSalva = [];

  IdeiaSalvaRepository();

  List<IdeiaSalva> get getListaIdeiaSalva => this.listaIdeiaSalva;

 set setListaIdeiaSalva(List<IdeiaSalva> listaIdeiaSalva) => this.listaIdeiaSalva = listaIdeiaSalva;
}