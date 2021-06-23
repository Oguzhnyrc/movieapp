import 'package:flutter/material.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:movieapp/servisler/firebaseDB.dart';
import 'package:provider/provider.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController txtMail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    final myDb = Provider.of<firebasedb>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.green.shade800,
                Colors.green.shade500,
                Colors.green.shade400,
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 90,),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Image.asset("assets/images/movie.png",width: 150,),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: txtMail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "E-mail Giriniz",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: txtPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Şifrenizi Giriniz",
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 4),
                      child: TextField(
                        maxLength: 16,
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "İsim",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right:8.0,left: 4),
                      child: TextField(
                        maxLength: 15,
                        controller: txtUsername,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: "Kullanıcı adı",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30)),
                  onPressed: () async{
                    await myAuth.register(txtMail.text, txtPassword.text);
                    await myDb.adduser(txtMail.text, txtPassword.text, txtName.text, txtUsername.text);
                    Navigator.pop(context);
                  },
                  child: Text("KAYIT OL", style: TextStyle(color: Colors.white, fontSize: 25)))
            ],
          ),
        ),
      ),
    );
  }
}
