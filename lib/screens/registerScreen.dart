import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
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
      padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtUserName,
                  decoration: InputDecoration(
                    labelText: "Entry User Name",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtFirstName,
                  decoration: InputDecoration(
                    labelText: "Entry First Name",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtLastName,
                  decoration: InputDecoration(
                    labelText: "Entry Last Name",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    labelText: "Entry email",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtWeight,
                  decoration: InputDecoration(
                    labelText: "Entry Your Weight",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtHeight,
                  decoration: InputDecoration(
                    labelText: "Entry Your height",
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
                    style: TextStyle(fontSize: fontSize),
                  ),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtYear,
                  decoration: InputDecoration(
                    labelText: "Entry Your Birthday",
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
                  child:
                      Text('Password:', style: TextStyle(fontSize: fontSize)),
                  flex: 2),
              Expanded(
                flex: 3,
                child: TextField(
                  controller: txtPassword,
                  decoration: InputDecoration(
                    labelText: "Entry Password",
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
              style: TextStyle(fontSize: 20, fontFamily: 'Redressed'),
            ),
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
