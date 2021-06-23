
import 'package:flutter/material.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:provider/provider.dart';

class forgotpasswordpage extends StatefulWidget {
  @override
  _forgotpasswordpageState createState() => _forgotpasswordpageState();
}

// ignore: camel_case_types
class _forgotpasswordpageState extends State<forgotpasswordpage> {
  TextEditingController txtmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.orange.shade800,
                Colors.orange.shade500,
                Colors.orange.shade400,
              ]),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.13,),
            Image.asset("assets/images/movie.png",width: 160,height: 160,),
            SizedBox(height: 10,),
            Text("Film uygulaması",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-mail Giriniz",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  icon: Icon(Icons.mail,color: Colors.black,),
                ),
              ),
            ),
            SizedBox(height: 30,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 30),
                child: Text("Sıfırla",style: TextStyle(fontSize: 25,color: Colors.white),),
              ),
              onPressed: (){
                myAuth.resetPassword(txtmail.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
