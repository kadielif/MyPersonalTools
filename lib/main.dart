import 'package:MyPersonalTools/screens/calculatorScreen.dart';
import 'package:MyPersonalTools/screens/loginScreen.dart';
import 'package:MyPersonalTools/screens/mainScreen.dart';
import 'package:MyPersonalTools/screens/registerScreen.dart';
import 'package:MyPersonalTools/screens/todoScreen.dart';
import 'package:MyPersonalTools/screens/waterScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static bool isActive = false;
  //static String activeUser = "";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => MainScreen(),
        "/login": (BuildContext context) => LoginScreen(),
        "/register": (BuildContext context) => RegisterScreen(),
        "/todo": (BuildContext context) => TodoScreen(),
        "/calculator": (BuildContext context) => CalculatorScreen(),
        "/water": (BuildContext context) => WaterScreen(),
      },
      initialRoute: isActive ? "/login" : "/login",
    );
  }
}
