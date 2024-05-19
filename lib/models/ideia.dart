import 'package:flutter/material.dart';

class Ideia{
  String titulo = "";
  String desc = "";
  String passoPasso = "";
  String img = "";
  String avaliacao = "";
  Color dificuldade = Colors.transparent;

  Ideia(this.titulo, this.desc, this.passoPasso, this.img, this.avaliacao, this.dificuldade);
  Ideia.n();
  Ideia.ti(this.titulo, this.img, this.dificuldade);

  get getAvaliacao => this.avaliacao;

 set setAvaliacao( avaliacao) => this.avaliacao = avaliacao;

  get getDificuldade => this.dificuldade;

 set setDificuldade( dificuldade) => this.dificuldade = dificuldade;
 String get getTitulo => this.titulo;

 set setTitulo(String titulo) => this.titulo = titulo;

  get getDesc => this.desc;

 set setDesc( desc) => this.desc = desc;

  get getPassoPasso => this.passoPasso;

 set setPassoPasso( passoPasso) => this.passoPasso = passoPasso;

  get getImg => this.img;

 set setImg( img) => this.img = img;
}