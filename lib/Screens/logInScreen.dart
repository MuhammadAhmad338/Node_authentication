import "package:flutter/material.dart";
import 'package:node_authentication/Screens/signUpScreen.dart';
import '../Constants/textField.dart';
import '../Services/authServices.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  AuthServices authServices = AuthServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Function for login  the user....Yippy
  logIn(BuildContext context, String email, String password) {
      authServices.login(context, email, password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Log In", style: TextStyle(
              fontWeight: FontWeight.bold
          )),
        ),
        body: Column(
          children:[
            const SizedBox(height: 20),
            const Text("Log In", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black
            )),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldContainer(
                  controller: emailController,
                  text: "Enter your email"
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFieldContainer(
                  controller: passwordController,
                  text: "Enter your password"
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => logIn(context, emailController.text, passwordController.text),
              child: const Text("Log In", style: TextStyle(
                  fontWeight: FontWeight.bold
              )),

            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen() ));
              },
              child: const Text("Want to Sign Up?", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              )),
            )
          ],
        )
    );
  }
}


