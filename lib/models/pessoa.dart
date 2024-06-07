// ignore_for_file: unnecessary_this, non_constant_identifier_names, unnecessary_new, avoid_print, unused_import, unnecessary_string_interpolations, invalid_required_positional_param


import 'package:flutter/material.dart';

class Pessoa{
  String name = "";
  String username = "";
  String email = "";
  String password = "";


  Pessoa(
   this.username,
   this.email, 
   this.password,
  );

  Pessoa.full(
   this.name,
   this.username,
   this.email, 
   this.password,
);

  Pessoa.json({
   required this.name,
   required this.username,
   required this.email, 
   required this.password,
});

  Pessoa.n();

  Map<String, dynamic> toJson() =>{
    'name': name,
    'username': username,
    'email': email,
    'password': password,
  };

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa.json(
    name: json['name'],
    username: json['username'],
    email: json['email'],
    password: json['password'],
  );



 
 String get getName => this.name;

 set setName(String name) => this.name = name;

 String get getUsername => this.username;

 set setUsername(String username) => this.username = username;

  get getEmail => this.email;

 set setEmail( email) => this.email = email;

  get getPassword => this.password;

 set setPassword( password) => this.password = password;
  

}