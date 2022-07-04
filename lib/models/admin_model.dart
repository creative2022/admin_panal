import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String email;
  final String uid;
  final String password;
  final String username;


  const AdminModel({

      required this.uid,
      required this.username,
      required this.password,
      required this.email,
      });

  static AdminModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AdminModel(
      uid: snapshot["uid"],
      email: snapshot["email"],
      password: snapshot["password"],
      username: snapshot["username"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "username": username,
      };
}
