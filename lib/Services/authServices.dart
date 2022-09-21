import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:node_authentication/Provider/userProvider.dart';
import 'package:node_authentication/Screens/signUpScreen.dart';
import 'package:provider/provider.dart';
import '../Helper/helper.dart';
import '../Models/user.dart';
import '../Screens/homeScreen.dart';
import '../constants.dart';
import 'sharedPreferencesServices.dart';

class AuthServices{

  void signUp(BuildContext context, String name , String email, String password) async {
    try {

      User user = User(
        name: name,
        email: email,
        password: password,
        id: "",
        token: ""
      );

      http.Response response = await http.post(Uri.parse("$url/api/signup"),
          body: user.toJson(),
          headers: <String, String> {
          "Content-Type": "application/json; charset=UTF-8"
          });

      httpErrorHandling(context: context, response: response,
      onSuccess: () {
         showSnackBar(context, "LogIn, with the same credentials");
      }
      );
    } catch(error){
      showSnackBar(context, error.toString());
    }
  }

  void login(BuildContext context, String email, String password) async {
    try{
      SharedPreferencesServices sharedPreferencesServices = SharedPreferencesServices();
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      http.Response response = await http.post(Uri.parse("$url/api/login"),
       body: jsonEncode({
         "email": email,
         "password": password
       }),
      headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8"
      });

      print(response.body);

      httpErrorHandling(response: response,
          context: context,
          onSuccess: () {

            userProvider.setUser(jsonEncode(jsonDecode(response.body)["user"]));
             sharedPreferencesServices.setString(jsonDecode(response.body)["token"]);

           showSnackBar(context, "You are logged In");
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HomeScreen()));
          });

    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  getUserData({required BuildContext context}) async {
    try{

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferencesServices sharedPreferencesServices = SharedPreferencesServices();
      String? token = await sharedPreferencesServices.getString();
      if(token == null){
        sharedPreferencesServices.setString(" ");
      }

      print(token);
      http.Response response = await http.post(Uri.parse("$url/isTokenValid"),
        headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!
        });

      var userRes = jsonDecode(response.body);
       print(userRes);
      if(userRes == true){
       http.Response res = await http.get(Uri.parse("$url/"),
       headers: <String, String> {
         "Content-Type": "application/json; charset=UTF-8",
         "x-auth-token": token
       });
       Map<String, dynamic> map = jsonDecode(res.body);
       Map<String, dynamic> userMap = jsonDecode(res.body)["user"];
       map.removeWhere((key, value) => key == "user");
       map.addAll(userMap);
       userProvider.setUser(jsonEncode(map));
      }
    } catch(err){
      showSnackBar(context, err.toString());
    }
  }

  signOut({required BuildContext context}) async {
    try{
      SharedPreferencesServices sharedPreferencesSerives = SharedPreferencesServices();
      sharedPreferencesSerives.setString(" ");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
    } catch(err){
      showSnackBar(context, err.toString());
    }
  }

}