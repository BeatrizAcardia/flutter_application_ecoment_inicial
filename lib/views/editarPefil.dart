// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar perfil",
          style: TextStyle(fontFamily: 'Circe', fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 150,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Alterar foto",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 58, 125, 68),
                    ),
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nome de usuário:",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sobre mim: ",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                    ),
                    maxLines:
                        null, // Permite que o TextField expanda verticalmente
                    keyboardType: TextInputType
                        .multiline, // Para permitir múltiplas linhas
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Alterar senha",
                      style: TextStyle(
                          fontFamily: 'Circe',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("(Deixe os campos em branco para não alterar)"),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Senha atual: ",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nova senha: ",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirme a senha atual",
                      style: TextStyle(
                          fontFamily: 'Circe', fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text(
                      "Alterar perfil",
                      style: TextStyle(
                        fontFamily: 'Circe',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 58, 125, 68),
                    ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
