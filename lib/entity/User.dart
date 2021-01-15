import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  int id, weight, height, birthday, water;
  String userName, firstName, lastName, email, password;
  bool isCompleted;
  DocumentReference reference;
  User.fromMap(Map<String, dynamic> map, {this.reference})
      : id = map['id'],
        weight = map['weight'],
        height = map['height'],
        birthday = map['birthday'],
        userName = map['userName'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        water = map['water'],
        email = map['email'],
        password = map['password'];
  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
