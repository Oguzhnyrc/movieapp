import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class jsondataread with ChangeNotifier {
  List movieclist = [];

  veriyazdirma(BuildContext context) async {
    var jsonoku = await DefaultAssetBundle.of(context).loadString("assets/data/moviecategory.json");
    List movieclist = json.decode(jsonoku.toString());
    for (int i = 0; i < 5; i++) {
      await FirebaseFirestore.instance.collection("category").doc(movieclist[i]).set({},SetOptions(merge: true));
    }
  }


}