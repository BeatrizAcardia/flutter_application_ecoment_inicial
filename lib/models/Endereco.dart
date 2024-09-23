// ignore_for_file: unnecessary_this

class Endereco{

  String title = "";
  String adress = "";
  String type = "";
  String time = "";
  double lat = 0, long = 0;

  Endereco(this.lat, this.long, this.title, this.type, this.adress, this.time);
  Endereco.vazio();

 String get getTitle => this.title;

 set setTitle(String title) => this.title = title;

  get getAdress => this.adress;

 set setAdress( adress) => this.adress = adress;

  get getType => this.type;

 set setType( type) => this.type = type;

  get getTime => this.time;

 set setTime( time) => this.time = time;

  get getLong => this.long;

 set setLong( long) => this.long = long;


  
 
  
  

 

  

 
}