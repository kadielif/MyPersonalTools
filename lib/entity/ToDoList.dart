import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoList {
  int id;
  String task;
  bool isCompleted;
  DocumentReference reference;
  ToDoList.fromMap(Map<String, dynamic> map, {this.reference})
      : id = map['id'],
        task = map['task'],
        isCompleted = map['isCompleted'];
  ToDoList.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
