// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class Ideia{
  String titulo = "";
  String autor = "";
  String desc = "";
  String passoPasso = "";
  String img = "";
  List<String> materiais = [];
  String material = "";
  
  int avaliacao = 0;
  Color dificuldade = Colors.transparent;

  Ideia(this.titulo, this.img, this.dificuldade, this.avaliacao, this.desc, this.passoPasso, this.autor, this.materiais);
  Ideia.n(this.titulo, this.img, this.dificuldade, this.avaliacao, this.desc, this.passoPasso, this.autor, this.materiais,this.material);
  Ideia.ti(this.titulo, this.img, this.dificuldade, this.avaliacao);
 
 String get getMaterial => this.material;

 set setMaterial(String material) => this.material = material;
 
 List<String> get getMateriais => this.materiais;

 set setMateriais(List<String> materiais) => this.materiais = materiais;
 
 String get getAutor => this.autor;

 set setAutor(String autor) => this.autor = autor;

 int get getAvaliacao => this.avaliacao;

 set setAvaliacao(int avaliacao) => this.avaliacao = avaliacao;


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