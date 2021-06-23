import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'authService.dart';

AuthService auth = new AuthService();

class firebasedb with ChangeNotifier {
  void adduser(String email, String password, String name, String username) async {
    Map<String, dynamic> users = Map();
    users["email"] = email;
    users["password"] = password;
    users["name"] = name;
    users["username"] = username;
    users["regdate"] = DateTime.now();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(auth.authid())
        .set(users, SetOptions(merge: true))
        .then((value) => debugPrint("add user data"));
  }

  void addData(var eklenecek, var data) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(auth.authid())
        .set({eklenecek: data}, SetOptions(merge: true));
  }
  
}
