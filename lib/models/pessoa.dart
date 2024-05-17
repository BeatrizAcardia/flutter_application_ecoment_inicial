// ignore_for_file: unnecessary_this, non_constant_identifier_names, unnecessary_new, avoid_print, unused_import, unnecessary_string_interpolations, invalid_required_positional_param


import 'package:flutter/material.dart';

class Pessoa{
  String username = "";
  String email = "";
  String password = "";


  Pessoa(
   this.username,
   this.email, 
   this.password,
  );

  Pessoa.n();

 String get getUsername => this.username;

 set setUsername(String username) => this.username = username;

  get getEmail => this.email;

 set setEmail( email) => this.email = email;

  get getPassword => this.password;

 set setPassword( password) => this.password = password;
  

}