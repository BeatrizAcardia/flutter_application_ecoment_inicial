import 'package:flutter_application_ecoment_inicial/Data/Postagem/GetPostagem.dart';
import 'package:flutter_application_ecoment_inicial/Data/Postagem/PostPostagem.dart';

class Postagem{
  late GetPostagem getPostagem;
  late PostPostagem postPostagem;

  Postagem(){
    this.getPostagem = GetPostagem();
    this.postPostagem = PostPostagem();
  }
}