import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';

class PessoaRepository{
  List<Pessoa> listaPessoa = [];

  PessoaRepository();

 List<Pessoa> get getListaPessoa => this.listaPessoa;

 set setListaPessoa(List<Pessoa> listaPessoa) => this.listaPessoa = listaPessoa;


}