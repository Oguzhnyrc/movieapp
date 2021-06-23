
import 'package:flutter/material.dart';
import 'package:movieapp/giris/sifremiunuttum.dart';
import 'package:movieapp/giris/kayitOl.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:provider/provider.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

// ignore: camel_case_types
class _loginpageState extends State<loginpage> {

  TextEditingController txtmail= TextEditingController();
  TextEditingController txtpw= TextEditingController();
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
                  Colors.green.shade900,
                  Colors.green.shade500,
                  Colors.green.shade300,
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13,),
                Image.asset("assets/images/movie.png",width: 160,height: 160,),
                SizedBox(height: 10,),
                Text("Film uygulaması",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
                  child: TextField(
                    controller: txtmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "E-mail Giriniz",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
                  child: TextField(
                    controller: txtpw,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi Giriniz",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(right:12.0),
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotpasswordpage()));
                          },
                          child: Text("şifrenizi mi unuttunuz?",style: TextStyle(fontSize: 16,color: Colors.black),)
                      )
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 40),
                    child: Text("GİRİŞ YAP",style: TextStyle(fontSize: 25,color: Colors.white),),
                  ),
                  onPressed: (){
                    myAuth.signin(txtmail.text, txtpw.text);
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hesabınız yok mu ?"),
                    SizedBox(width: 5,),
                    InkWell(
                      child: Text("buraya dokunun",style: TextStyle(color: Colors.blue.shade500),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signupPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
