//import 'dart:html';

import 'package:MyPersonalTools/entity/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginScreen.dart';
//import 'package:firebase_core/firebase_core.dart';

class TodoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoStateScreen();
  }
}

class TodoStateScreen extends State<TodoScreen> {
  TextEditingController txtTask = TextEditingController();
  Widget swapWidget;
  int id = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LoginState.activeUserFirstName.toUpperCase() + '`S TO DO LIST',
            style: GoogleFonts.podkova(fontSize: 22),
          ),
          backgroundColor: Colors.green.shade300,
          actions: [
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: todoListContainer(context),
        floatingActionButton: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Expanded(
                flex: 8,
                child: TextField(
                  controller: txtTask,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: "New Task",
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.add_circle_outline_outlined,
                  size: 45,
                  color: Colors.green.shade400,
                ),
                tooltip: "Add New Task",
                onPressed: () {
                  addData(txtTask.text);
                },
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }

  Future<void> addData(String task) async {
    CollectionReference tsk = Firestore.instance.collection('todo');
    var data = {'id': id, 'task': task, 'isCompleted': false};
    id++;
    txtTask.text = "";
    Firestore.instance.runTransaction((Transaction crudTransaction) async {
      //tsk = Firestore.instance.collection('todo');
      tsk.add(data);
    });
  }

  Widget todoListContainer(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('todo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          return buildBody(context,
              snapshot.data.documents); //burada firebasede ki data yollanır.
        }
      },
    );
  }

  Widget buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade100,
      ),
      child: ListView(
        padding: EdgeInsets.only(top: 20.0),
        children: snapshot
            .map<Widget>((data) => buildListItem(context, data))
            .toList(),
      ),
    );
  }

  buildListItem(BuildContext context, DocumentSnapshot data) {
    final row = ToDoList.fromSnapshot(data);
    return Padding(
      key: ValueKey(row.id),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.8),
      child: Container(
          color: Colors.green.shade200,
          height: 60,
          child: ListTile(
            title: Text(
              row.task,
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20),
            ),
            trailing: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.trash,
                size: 25,
              ),
              onPressed: () => row.reference.delete(),
            ),
            leading: IconButton(
              icon: Icon(
                row.isCompleted == true
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank,
                size: 30,
              ),
              onPressed: () => row.reference.updateData(
                  {'isCompleted': row.isCompleted = !row.isCompleted}),
            ),
          )),
    );
  }
}
