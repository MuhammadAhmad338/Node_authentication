import 'package:flutter/material.dart';
import 'package:node_authentication/Services/authServices.dart';
import 'package:provider/provider.dart';
import 'Provider/userProvider.dart';
import 'Screens/homeScreen.dart';
import 'Screens/logInScreen.dart';
import 'Screens/signUpScreen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: const MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  AuthServices authServices = AuthServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authServices.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Node Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty ? SignUpScreen()  : HomeScreen(),
    );
  }
}


