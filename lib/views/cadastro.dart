// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  GlobalKey<FormState> keyVal = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ecoMomentIcon = SizedBox(width: 200, child: Image.asset("assets/imgs/EcoMomenticon.ico"));

  final ecoMomentIcon2 = SizedBox(width: 80, child: Image.asset("assets/imgs/reciclagem-icone.png"));

  ImageIcon googleIcon = ImageIcon(
    size: 20,
    AssetImage("assets/imgs/google.png")
  );

  Text title = Text("CADASTRE-SE", style: TextStyle(
    fontSize: 50,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 5, 68, 16),
    shadows: <Shadow>[
                Shadow(
                  offset: Offset(3.0, 2.0),
                  blurRadius: 2.0,
                  color: Color.fromRGBO(5, 68, 16, 0.44),
                ),
              ],
  ),);


  final usernameLabel = SizedBox(width: 400, child: Text("Nome de usuário:", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
  ),));


  final emailLabel = SizedBox(width: 400, child: Text("E-mail:", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
  ),));

  final passwordLabel = SizedBox(width: 400, child: Text("Senha:", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
  ),));

  final orLabel = SizedBox(child: Text("ou", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
  ),));

  final buttonLabel = SizedBox(child: Text("CADASTRAR", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
    color: Colors.black,
    
  ),)
  );
  final googleLabel = SizedBox(child: Text("CONTINUAR COM O GOOGLE", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
    color: Colors.black,
    
  ),)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(key:keyVal ,child: Column(children: [
        Padding(padding: EdgeInsets.fromLTRB(50, 60, 50, 0)),

        Align(alignment: Alignment.center,
        child:ecoMomentIcon ,
        ),
        SizedBox(height: 2,),

        Align(alignment: Alignment.center,
          child:title,
        ),
        SizedBox(height: 20,),

        usernameLabel,
        SizedBox(height: 10,),
        
        Container(
          width: 400,
          child: TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.person),
            labelText: "Nome"),
            validator: (value){
              if (value!.trim().isEmpty){
                return "Este campo não pode estar vazio. Preencha o campo corretamente";
              }else if (value!.trim().length < 3){
                return "O nome de usuario deve ter mais que 3 caracteres";
              }else if(value!.trim().length > 14){
                return "O nome de usuario deve ter menos que 15 caracteres";
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20,),

        emailLabel,
        SizedBox(height: 10,),

        Container(
          width: 400,
          child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.mail),
            labelText: "E-mail"),
            validator: (value) => !EmailValidator.validate(value!) ? 'Digite um email válido' : null,
          ),
        ),
        SizedBox(height: 20,),

        passwordLabel,
        SizedBox(height: 10,),

        Container(
          width: 400,
          child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.lock),
            labelText: "Senha"),
            validator: (value) {
              if(value!.trim().isEmpty){
                return "Este campo não pode estar vazio. Preencha o campo corretamente";
              }else if (value!.trim().length < 5){
                return "No minimo 5 caracteres";
              }else if (value!.trim().length >= 8){
                return "No máximo 8 caracteres";
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 30,),
        
        Container(
          width: 200,
          height: 70,
          child: ElevatedButton(onPressed: () {
          if(keyVal.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Sucesso!"))
              );
              setState(() {

            });
            }
        }, child: buttonLabel, style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 121, 193, 39)),
            borderRadius: BorderRadius.circular(50), // Ajuste o valor conforme necessário para tornar o botão mais quadrado
          ),
        ),),
        ),
        SizedBox(height: 20,),
        
        Align(
          alignment: Alignment.center,
          child: orLabel,
        ),
        SizedBox(height: 20,),

        Container(
          width: 350,
          height: 50,
          child: ElevatedButton.icon(onPressed: () {
            
          }, 
          icon: googleIcon,
          label: googleLabel,
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(255, 121, 193, 39)),
            borderRadius: BorderRadius.circular(10), // Ajuste o valor conforme necessário para tornar o botão mais quadrado
          ),
        ),),
        ),
        SizedBox(height: 25,),
        
        Align(
          alignment: Alignment.center,
          child:ecoMomentIcon2
        )

      ],),),
    );
  }
}