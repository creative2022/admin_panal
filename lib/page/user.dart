import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String firstname;
  final String lastname;
  final String phone;
  final String password;

  final List followers;
  final List following;

  const UserModel(
      {required this.firstname,
      required this.uid,
      required this.phone,
      required this.password,
      required this.photoUrl,
      required this.email,
      required this.lastname,
      required this.followers,
      required this.following,});

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      firstname: snapshot["firstname"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      password: snapshot["password"],
      photoUrl: snapshot["photoUrl"],
      phone: snapshot["phone"],
      lastname: snapshot["lastname"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "uid": uid,
        "email": email,
        "password": password,
        "photoUrl": photoUrl,
        "lastname": lastname,
        "phone": phone,
        "followers": followers,
        "following": following,
      };
}
