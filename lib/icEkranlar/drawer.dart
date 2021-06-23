import 'package:flutter/material.dart';
import 'package:movieapp/icEkranlar/grafik.dart';
import 'package:movieapp/ekranlar/hakk%C4%B1m%C4%B1zda.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:movieapp/servisler/firebaseDB.dart';
import 'package:provider/provider.dart';

import 'notpage.dart';

class drawerpage extends StatefulWidget {
  @override
  _drawerpageState createState() => _drawerpageState();
}

class _drawerpageState extends State<drawerpage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    final myDB = Provider.of<firebasedb>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade500,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/movie.png",width: 80,),
                  Text("Film uygulaması",style: TextStyle(fontSize: 30),),
                ],
              )),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Hakkımzda'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => aboutpage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Film istatistikleri'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => graphic()));
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Çıkış yap'),
            onTap: () {
              myAuth.signout();
            },
          ),
        ],
      ),
    );
  }
}