import 'package:flutter/material.dart';
import 'package:movieapp/giris/girissayfasi.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:provider/provider.dart';
import '../ekranlar/anasayfa.dart';

// ignore: camel_case_types
class loginstatus extends StatefulWidget {
  @override
  _loginstatusState createState() => _loginstatusState();
}

class _loginstatusState extends State<loginstatus> {
  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    switch (myAuth.status) {
      case userstatus.oturumaciliyor:
        return Scaffold(
          body: Center(
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      case userstatus.oturumacilmamis:
        return loginpage();
      case userstatus.oturumacilmis:
        return homepage();
    }
  }
}
