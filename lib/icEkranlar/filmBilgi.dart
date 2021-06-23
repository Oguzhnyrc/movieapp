import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class moviecontentpage extends StatefulWidget {
  String category;
  String moviename;
  String videocode;
  moviecontentpage(this.category, this.moviename,this.videocode);

  @override
  _moviecontentpageState createState() => _moviecontentpageState();
}

class _moviecontentpageState extends State<moviecontentpage> {


  double _width = 200;

  double _updatestate() {
    setState(() {
      _width = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('category')
        .doc(widget.category)
        .collection("filmlist");

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: widget.videocode,
        flags: YoutubePlayerFlags(autoPlay: true, mute: false));

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(widget.moviename).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data.data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  child: InkWell(
                                    onTap: () {
                                      _updatestate();
                                    },
                                    child: Image.network(
                                      data["image"],
                                      width: _width,
                                    ),
                                  ))),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "İsim : " + data["name"],
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Başroldekiler : " + data["Başroldekiler"],
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Süre : " + data["süre"].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Ç.Tarihi : " + data["çtarihi"].toString(),
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Açıklama : " + data["açıklama"],
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                            height: 1,
                          ),
                          YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.green,

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
