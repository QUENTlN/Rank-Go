import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:rank_and_go/allowCreditPoster.dart';
import 'package:rank_and_go/createPoster.dart';
import 'package:rank_and_go/models/media.dart';
import 'package:rank_and_go/models/poster.dart';
import 'package:rank_and_go/videoPrevisualisationWidget.dart';
import 'dart:io';







class previsualisationPoster extends StatefulWidget {


  final Poster posterPrevisu;
  final Media mediaPrevisu;

  const previsualisationPoster({Key key, @required this.posterPrevisu, @required this.mediaPrevisu})
      : super(key: key);

  @override
  _previsualisationPosterState createState() => _previsualisationPosterState();
}

class _previsualisationPosterState extends State<previsualisationPoster> {

  //check if the file is a picture
  static bool isImageFile(String path) {
    final mimeType = lookupMimeType(path);
    return(mimeType.startsWith('image'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color(0xff242D4D),
      body: Container(
        color: new Color(0xff242D4D),
        child: SingleChildScrollView(
          physics: new BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, top:60, right: 30, bottom:0),
                color: new Color(0xff242D4D),
                child:

                isImageFile(widget.mediaPrevisu.path) ?

                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2 ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),

                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Stack(
                          children: <Widget>[ Container(
                            height:490.0,
                            child: Center(
                                child: Image.file(
                                  File(widget.mediaPrevisu.path),
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          ),
                            Positioned(
                              bottom: 0,
                              left: 5,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      widget.posterPrevisu.title,
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCerealBold',
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      widget.posterPrevisu.descrption,
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCerealBook',
                                          fontSize: 19,
                                          color: Colors.white),
                                    ),
                                  ]
                              ),
                            ),
                          ]

                      ),
                    ],
                  ),
                )
                    : VideoPrevisiualisationWidget(
                  url: widget.mediaPrevisu.path, play: true,
                ),
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: new IconButton(
                            icon: Icon(Icons.arrow_back_sharp,
                                color: new Color(0xFF1DE4AE), size: 60),
                            onPressed: (){ Navigator.pop(context);})),
                    Expanded(
                        child: new IconButton(
                            icon: Icon(Icons.check_circle,
                                color: new Color(0xFF1DE4AE), size: 60),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllowCreditPoster()));
                            }))
                  ])
            ],
          ),

        ),
      ),
    );
  }
}
