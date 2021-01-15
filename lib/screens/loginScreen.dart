import 'package:MyPersonalTools/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  static String _activeUser = "";
  static String _activeUserFirstName = "";
  static int _manyGlass;

  static String get activeUser => _activeUser;
  static String get activeUserFirstName => _activeUserFirstName;
  static int get manyGlass => _manyGlass;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: buildContainer(context),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  buildContainer(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade300,
      ),
      padding: EdgeInsets.fromLTRB(25, 100, 30, 100),
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 50),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 3.0, color: const Color(0xFFFFFFFF)),
          borderRadius: new BorderRadius.circular(8),
        ),
        child: Column(children: <Widget>[
          Text('My Personal Tools',
              style: GoogleFonts.redressed(
                  fontSize: 40, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: txtUserName,
            decoration: InputDecoration(
              labelText: "Entry Name",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: txtPassword,
            decoration: InputDecoration(
              labelText: "Entry Password",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            onPressed: () => login(txtUserName.text, txtPassword.text),
            child: Text('Login',
                style: GoogleFonts.podkova(
                    fontSize: 30, fontStyle: FontStyle.normal)),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          ),
          SizedBox(
            height: 60,
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            onPressed: () => login(txtUserName.text, txtPassword.text),
            child: Text('Not a member? Sign up now',
                style: GoogleFonts.podkova(
                    fontSize: 18, fontStyle: FontStyle.normal)),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          ),
        ]),
      ),
    );
  }

  login(String userName, String password) {
    Firestore.instance
        .collection('users')
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              if (doc['userName'] == userName && doc['password'] == password) {
                setState(() {
                  MyApp.isActive = true;
                  _activeUser = userName;
                  _manyGlass = doc['water'];
                  _activeUserFirstName = doc['firstName'];
                });
                Navigator.pushNamed(context, '/');
                txtUserName.clear();
                txtPassword.clear();
              }
            }));
  }
}
