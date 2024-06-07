// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, body_might_complete_normally_nullable, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Pessoa p1 = Pessoa("VHSNWLF", "cl202247@g.unicamp.br", "abcd12345");
  Pessoa p2 = Pessoa("Belatrix", "cl202228@g.unicamp.br", "abcd1234");
  List<Pessoa> listaPessoa = [];
  GlobalKey<FormState> keyVal = GlobalKey();
  TextEditingController usernameEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ecoMomentIcon = SizedBox(width: 200, child: Image.asset("assets/imgs/EcoMomenticon.ico"));

  final ecoMomentIcon2 = SizedBox(width: 80, child: Image.asset("assets/imgs/reciclagem-icone.png"));

  ImageIcon googleIcon = ImageIcon(
    size: 20,
    AssetImage("assets/imgs/google.png")
  );

  Text title = Text("Login", style: TextStyle(
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


  final usernameLabel = SizedBox(width: 400, child: Text("E-mail / Nome de usuário:", style: TextStyle(
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

  final noAccLabel = SizedBox(child: Text("Não tem uma conta?", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
  ),));
  final noAccLabel2 = SizedBox(child: Text("Cadastre-se", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Circe',
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 121, 193, 39)
  ),));

  final buttonLabel = SizedBox(child: Text("Entrar", style: TextStyle(
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
      body:SingleChildScrollView(child: Form(key: keyVal,child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(children: [
        Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 0)),

        Align(alignment: Alignment.center,
        child:ecoMomentIcon ,
        ),

        Align(alignment: Alignment.center,
          child:title,
        ),
        SizedBox(height: 20,),

        Container(
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
        SizedBox(height: 10,),

        Align(
          alignment: Alignment.center,
          child: orLabel,
        ),
        SizedBox(height: 10,),

        usernameLabel,
        SizedBox(height: 10,),
        
        SizedBox(
          width: 400,
          child: TextFormField(
          controller: usernameEmailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.person),
            labelText: "Nome"),
            validator: (value) {
              if (value!.trim().isEmpty){
                return "Este campo não pode estar vazio. Preencha o campo corretamente";
              }
            },
          ),
        ),
        SizedBox(height: 20,),

        passwordLabel,
        SizedBox(height: 10,),

        Container(
          width: 400,
          child: TextFormField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(Icons.lock),
            labelText: "Senha"),
            validator: (value) {
              if (value!.trim().isEmpty){
                return "Este campo não pode estar vazio. Preencha o campo corretamente";
              }
            },
          ),
        ),
        SizedBox(height: 30,),
        
        Container(
          width: 130,
          height: 50,
          child: ElevatedButton(onPressed: () {
          if(keyVal.currentState!.validate()){
            listaPessoa.add(p1);
            listaPessoa.add(p2);
            if(verificaUser(usernameEmailController.text, passwordController.text)){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Myinicial(),));
            }else{
              showDialog(context: context,
               builder: (BuildContext context) {
                 return AlertDialog(
                          title: Text('Dados incorretos'),
                          content: Text('Usuario/Email e/ou senha estão incorretos'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fechar'),
                            ),
                          ],
                        );
               },
               );
            }
            
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
        
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          noAccLabel,
          SizedBox(width: 5,),
          GestureDetector(
          child:noAccLabel2,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro(),));
          },
          )
        ],),
        SizedBox(height: 30,),
        
        Align(
          alignment: Alignment.center,
          child:ecoMomentIcon2
        )

      ],),),) )
    );
  }

  bool verificaUser(String userEmail, String password) {
  for (Pessoa p in listaPessoa) {
    if (p.getUsername == userEmail && p.getPassword == password) {
      return true;
    }
  }
  return false;
}
}