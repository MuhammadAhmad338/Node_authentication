import 'package:flutter/material.dart';
import '../Models/user.dart';

class UserProvider extends ChangeNotifier{

  User  _user = User(
      name: "",
      email: "",
      password : "",
      id: "",
      token: ""
  );

  User get user => _user;

  void setUser(String user){
     _user = User.fromJson(user);
     notifyListeners();
  }

}