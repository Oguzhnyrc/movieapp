
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/icEkranlar/filmBilgi.dart';

class movielistpage extends StatefulWidget {
  String categoryname;
  movielistpage(this.categoryname);
  @override
  _movielistpageState createState() => _movielistpageState();
}

class _movielistpageState extends State<movielistpage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('category')
        .doc(widget.categoryname)
        .collection("filmlist")
        .snapshots();
    return Scaffold(
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
                                document.data()["name"],textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => moviecontentpage(widget.categoryname,document.id,document.data()["videocode"])));
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
