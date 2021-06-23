import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/icEkranlar/filmlistesi.dart';
import 'package:movieapp/icEkranlar/drawer.dart';
import 'package:movieapp/servisler/authService.dart';
import 'package:provider/provider.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    // final myJson = Provider.of<jsondataread>(context);
    // myJson.veriyazdirma(context);
    // Json ile veri okuyup gelen veriyi firebase yazdırdık.
    // Bu sayede merkezcil olark firebase kullanmışş olduk.

    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('category').snapshots();

    return Scaffold(
      drawer: drawerpage(),
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(document.data()["image"]),
                          fit: BoxFit.cover),
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                        child: InkWell(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3)),
                              child: Text(
                                document.id,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => movielistpage(document.id)));
                          },
                        )),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
