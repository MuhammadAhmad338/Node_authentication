import  "package:flutter/material.dart";
import '../Constants/textField.dart';
import '../Services/authServices.dart';
import 'logInScreen.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

   AuthServices authServices = AuthServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Function for signUp the user
  signUp(BuildContext context, String name, String email, String password) {
    authServices.signUp(context, name, email, password);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: const Text("Sign Up", style: TextStyle(
          fontWeight: FontWeight.bold
         )),
      ),
        body: Column(
        children:  [
          const SizedBox(height: 20),
         const Text("Sign Up", style: TextStyle(
           fontWeight: FontWeight.bold,
             fontSize: 22,
             color: Colors.black
         )),
         const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFieldContainer(
                controller: nameController,
                text: "Enter your name"
            ),
          ),
         const SizedBox(height: 8),
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => signUp(context, nameController.text, emailController.text, passwordController.text),
            child: const Text("Sign Up", style: TextStyle(
              fontWeight: FontWeight.bold
            ))
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen() ));
            },
            child: const Text("Want to Log In?", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue
            )),
          )
        ],
      )
    );
  }
}
