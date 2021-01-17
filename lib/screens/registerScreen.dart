import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<RegisterScreen> {
  int id = 1000;
  double fontSize = 20, sizedBoxHeight = 10;
  TextEditingController txtUserName = new TextEditingController();
  TextEditingController txtFirstName = new TextEditingController();
  TextEditingController txtLastName = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPassword = new TextEditingController();
  TextEditingController txtWeight = new TextEditingController();
  TextEditingController txtHeight = new TextEditingController();
  TextEditingController txtYear = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: buildContainer(context),
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: Colors.green.shade400,
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              iconSize: 20,
              onPressed: () => Navigator.pushNamed(context, '/login'),
              padding: EdgeInsets.only(right: 20),
            ),
          ],
        ),
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
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 3.0, color: const Color(0xFFFFFFFF)),
          borderRadius: new BorderRadius.circular(8),
        ),
        child: Column(children: <Widget>[
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Name:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtUserName,
                  decoration: InputDecoration(
                    labelText: "Entry User Name",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'First Name:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtFirstName,
                  decoration: InputDecoration(
                    labelText: "Entry First Name",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Last Name:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtLastName,
                  decoration: InputDecoration(
                    labelText: "Entry Last Name",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Email:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    labelText: "Entry email",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Weight:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtWeight,
                  decoration: InputDecoration(
                    labelText: "Entry Your Weight",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Height:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtHeight,
                  decoration: InputDecoration(
                    labelText: "Entry Your height",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    'Birthday:',
                    style: GoogleFonts.podkova(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtYear,
                  decoration: InputDecoration(
                    labelText: "Entry Your Birthday",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizedBoxHeight,
          ),
          Row(
            children: [
              Expanded(
                  child: Text('Password:',
                      style: GoogleFonts.podkova(fontSize: fontSize)),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Entry Password",
                    labelStyle: GoogleFonts.podkova(fontSize: fontSize),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            onPressed: () => addUser(
                txtUserName.text,
                txtFirstName.text,
                txtLastName.text,
                txtEmail.text,
                txtPassword.text,
                txtWeight.text,
                txtHeight.text,
                txtYear.text),
            child: Text(
              'REGISTER',
              style: GoogleFonts.podkova(fontSize: 25),
            ),
            color: Colors.green.shade100,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
          ),
        ]),
      ),
    );
  }

  Future<void> addUser(
      String userName,
      String firstName,
      String email,
      String lastName,
      String password,
      String weight,
      String height,
      String birthday) async {
    CollectionReference tsk = Firestore.instance.collection('users');
    double water = (double.tryParse(weight) * 0.03 / 0.2).floorToDouble();

    var data = {
      'id': id,
      'userName': userName,
      'firstName': firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "weight": weight,
      "height": height,
      "birthday": birthday,
      "water": water,
    };
    id++;
    Firestore.instance.runTransaction((Transaction crudTransaction) async {
      try {
        tsk.add(data);
      } catch (e) {
        print(e.toString());
      }
      txtUserName.clear();
      txtFirstName.clear();
      txtLastName.clear();
      txtEmail.clear();
      txtPassword.clear();
      txtWeight.clear();
      txtYear.clear();
      txtHeight.clear();
      Navigator.pushNamed(context, "/login");
    });
  }
}
