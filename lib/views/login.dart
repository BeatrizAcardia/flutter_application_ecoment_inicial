// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoa.dart';
import 'package:flutter_application_ecoment_inicial/models/pessoaProvider.dart';
import 'package:flutter_application_ecoment_inicial/views/cadastro.dart';
import 'package:flutter_application_ecoment_inicial/views/inicial.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Pessoa p1 =
      Pessoa.full("Vitor H.", "Vitinho do grau 007 19😎", "cl202247@g.unicamp.br", "abcd12345");
  List<Pessoa> listaPessoa = [];
  GlobalKey<FormState> keyVal = GlobalKey();
  TextEditingController usernameEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GlobalState>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/Teladelogin.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Form(
            key: keyVal,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/imgs/EcoMomenticon.ico",
                    width: 350,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff94b64b),
                            ),
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
                            controller: usernameEmailController,
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
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 400,
                          child: Text(
                            "Senha:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 400,
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffe3ebf2),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Color(0xffe3ebf2),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Este campo não pode estar vazio. Preencha o campo corretamente";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: 130,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (keyVal.currentState!.validate()) {
                                listaPessoa.add(p1);
                                if (verificaUser(usernameEmailController.text,
                                    passwordController.text)) {
                                  Pessoa dadosUser = dadosUsuario(
                                      usernameEmailController.text,
                                      passwordController.text);
                                  user.setName(dadosUser.getName);
                                  user.setUsername(dadosUser.getUsername);
                                  user.setEmail(dadosUser.getEmail);
                                  user.setPassword(dadosUser.getPassword);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Myinicial(),
                                      ));
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Dados incorretos'),
                                        content: Text(
                                            'Usuario/Email e/ou senha estão incorretos'),
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

                                setState(() {});
                              }
                            },
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff3a7d44),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Não tem uma conta?",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff94b64b),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cadastro(),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool verificaUser(String userEmail, String password) {
    for (Pessoa p in listaPessoa) {
      if ((p.getUsername == userEmail || p.getEmail == userEmail) && p.getPassword == password) {
        return true;
      }
    }
    return false;
  }

  Pessoa dadosUsuario(String username, String password) {
    Pessoa pe = Pessoa.n();
    listaPessoa.forEach(
      (Pessoa p) {
        if ((p.getUsername == username || p.getEmail == username) && p.getPassword == password) {
          pe.setName = p.getName;
          pe.setUsername = p.getUsername;
          pe.setEmail = p.getEmail;
          pe.setPassword = p.getPassword;
        }
      },
    );
    return pe;
  }
}
