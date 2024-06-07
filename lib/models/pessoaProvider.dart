import 'package:flutter/material.dart';

class GlobalState with ChangeNotifier {
  String _name = "";
  String _username = "";
  String _email = "";
  String _password = "";

  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get password => _password;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}