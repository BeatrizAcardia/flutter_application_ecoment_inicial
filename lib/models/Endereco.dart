// ignore_for_file: unnecessary_this

class Endereco{
  String titulo = "";
  String endereco = "";

  Endereco(this.titulo, this.endereco);
  Endereco.n();

 String get getTitulo => this.titulo;

 set setTitulo(String titulo) => this.titulo = titulo;

  get getEndereco => this.endereco;

 set setEndereco( endereco) => this.endereco = endereco;
}