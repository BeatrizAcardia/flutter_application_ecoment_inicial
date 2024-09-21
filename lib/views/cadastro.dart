// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_ecoment_inicial/Controller/ControllerPessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  Pessoa? _pessoa;
  List<Pessoa> listaP = [];
  GlobalKey<FormState> keyVal = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    TextEditingController passwordController2 = TextEditingController();

  Future<void> _loadPessoa() async {
    Pessoa? pessoa = await SharedPreferencesHelper.getPessoa();
    setState(() {
      _pessoa = pessoa;
    });
  }

  Future<void> savePessoa(String _name, String _username, String _email, String _password) async {
    Pessoa pessoa = Pessoa.json(name: _name, username: _username, email: _email, password: _password);
    await SharedPreferencesHelper.savePessoa(pessoa);
    _loadPessoa();
  }

  final buttonLabel = SizedBox(child: Text("CADASTRAR", style: TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    
  ),)
  );

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 900,
              width: 1000,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/TeladeCadastro.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: keyVal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        "assets/imgs/EcoMomenticon.ico",
                        width: 120,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff94b64b),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "Nome:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color(0xffe3ebf2),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Este campo não pode estar vazio. Preencha o campo corretamente";
                          } else if (value.trim().length < 10) {
                            return "O Nome Completo deve ter mais que 10 caracteres";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "Nome de usuário:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color(0xffe3ebf2),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Este campo não pode estar vazio. Preencha o campo corretamente";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "Email:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color(0xffe3ebf2),
                          filled: true,
                        ),
                        validator: (value) => !EmailValidator.validate(value!)
                            ? 'Digite um email válido'
                            : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "Senha:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color(0xffe3ebf2),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Este campo não pode estar vazio. Preencha o campo corretamente";
                          } else if (value.trim().length < 5) {
                            return "No minimo 5 caracteres";
                          } 
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "Repita a senha:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: passwordController2,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Color(0xffe3ebf2),
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Este campo não pode estar vazio. Preencha o campo corretamente";
                          }
                          else if(value != passwordController.text){
                            return "As senhas devem ser iguais";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (keyVal.currentState!.validate()) {
                            // savePessoa(usernameController.text, usernameController.text, emailController.text, passwordController.text);
                            cadastrarP(usernameController.text,
                            emailController.text, passwordController.text);
                            globalState.setName(nameController.text);
                            globalState.setUsername(usernameController.text);
                            globalState.setEmail(emailController.text);
                            globalState.setPassword(passwordController.text);
                            // mostrar();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Myinicial(),
                                ));
                            setState(() {});
                          }
                        },
                        child: buttonLabel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff3B5364),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50), // Ajuste o valor conforme necessário para tornar o botão mais quadrado
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cadastrarP(String username, String email, String password){
    Pessoa p = Pessoa(username, email, password);
    listaP.add(p);
  }

  void mostrar(){
    listaP.forEach((Pessoa p) {
      print("DADOS");
      print(p.getUsername);
      print(p.getEmail);
      print(p.getPassword);
      print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
    });
  }
}