import "package:flutter/material.dart";
import 'package:node_authentication/Provider/userProvider.dart';
import 'package:provider/provider.dart';

import '../Services/authServices.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

 AuthServices authServices = AuthServices();
  signOut({required BuildContext context}) {
    authServices.signOut(context: context);
  }


  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context).user;
    print( userProvider.name);
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(userProvider.id),
            Text(userProvider.name),
            Text(userProvider.email),
            const SizedBox(height: 50),
            const Text("Hello World"),
            const SizedBox(height: 50),
            ElevatedButton(onPressed: () => signOut(context: context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white)
                  )),
                child: const Text("Sign Out",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                )
          ],
        ),
      )
    );
  }
}
