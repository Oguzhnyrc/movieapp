import 'package:flutter/material.dart';

class aboutpage extends StatefulWidget {
  @override
  _aboutpageState createState() => _aboutpageState();
}

class _aboutpageState extends State<aboutpage> {
  Color renk = Colors.blue;
  double _width = 50;
  double _height = 50;
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  renk = Colors.orange;
                });
              },
              onDoubleTap: (){
                setState(() {
                  _width = 100;
                });
              },
              onLongPress: (){
                setState(() {
                  _height = 100;
                });
              },
              onTapCancel: (){
                setState(() {
                  renk = Colors.red;
                  _width = 100;
                  _height = 100;
                });
              },
              onHorizontalDragCancel: (){
                setState(() {
                  _text = "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen '3006881' kodlu 'Mobil Programlama' dersi kapsamında '173006023' numaralı 'Oğuzhan YARICI' tarafından '25 Haziran 2021' günü yapılmıştır.";
                  _width = double.infinity;
                  _height = 300;
                });
              },
              child: Container(
                color: renk,
                height: _width,
                width: _height,
                child: Text(_text),
              ),
            )
          ],
        ),
      ),
    );
  }
}
