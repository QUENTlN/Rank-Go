import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';
import 'package:rank_and_go/videoWidget.dart';
import 'package:rank_and_go/models/media.dart';
import 'package:rank_and_go/models/poster.dart';
import 'package:rank_and_go/createPoster.dart';



void main() {
  runApp(new GalleryPoster());
}
class GalleryPoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rank & Go',
      theme: new ThemeData(
        primaryColor: const Color(0xff242D4D),
      ),
      home: new MyGalleryPoster(),
    );
  }
}

class MyGalleryPoster extends StatefulWidget {
  MyGalleryPoster({Key key}) : super(key: key);
  @override
  _MyGalleryPosterState createState() => new _MyGalleryPosterState();
}

class _MyGalleryPosterState extends State<MyGalleryPoster> {

  final List<Poster> _posterListe=[
    //Poster(1, "yes", "oui", false, 1, true, 1, TypeNote.oneToFive)
  ];
  //final List<File> _fileListe=[];
  final List<Media> _mediaListe=[

  ];
  VideoPlayerController _videoPlayerController;
  //AnimationController controller;
  File video;


  void _addNewPoster(int idPoster, String posterDesc, String posterTitle, bool commentEnable, int creditsAllow, int idUser, bool state, File selectedImage, Media media1, Media media2,Media media3) {
    if(idPoster != null){
      final newPoster = Poster(idPoster, posterDesc, posterTitle, state, creditsAllow, commentEnable, idUser, TypeNote.oneToFive, media1, media2, media3);
      final newMedia = Media(selectedImage.path);
      setState(() {
        _posterListe.add(newPoster);
        _mediaListe.add(newMedia);
        //_fileListe.add(selectedImage);
      });
    }
  }

  //check if the file is a picture
  static bool isImageFile(String path) {
    final mimeType = lookupMimeType(path);
    return(mimeType.startsWith('image'));
  }

  //check if the file is a video
  bool isVideoFile(String path) {
    final mimeType = lookupMimeType(path);
    return(mimeType.startsWith('video'));
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xff242D4D),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(25.0),
        child: _posterListe.isEmpty ? Column(
            children: <Widget>[
              Text(
                'Pas de poster pour l\'instant',
              ),
              SizedBox(height: 10,),
            ]) : ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 30, );
          },
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return new Container(
              color: new Color(0xff242D4D),
              child: new Container( margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2 )
                  ),

                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Stack(
                          children: <Widget>[ Container(
                            height:350.0,
                            child: Center(
                                child: isImageFile(_mediaListe[index].path) ?
                                Image.file(
                                  File(_mediaListe[index].path),
                                  fit: BoxFit.fill,
                                )
                                    :
                                isVideoFile(_mediaListe[index].path) ?
                                VideoWidget(url: _mediaListe[index].path, play: true)
                                    :
                                Container()
                            ),

                          ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.black12, Colors.black26],
                                        begin: FractionalOffset.centerRight,
                                        end: FractionalOffset.centerLeft)
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${_posterListe[index].title} ',
                                                style:TextStyle(
                                                    fontSize:20,
                                                    color:Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'DayRoman'
                                                ),

                                              )
                                            ]
                                        )
                                    )

                                )
                            )
                            ,]

                      ),

                      Container(
                          child: Row(
                              children : <Widget>[
                                Expanded(
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Color(0xff242D4D),
                                      child: FlatButton(
                                        textColor: new Color(0xFF646E9F),
                                        height: 60.0,
                                        color: new Color(0xff242D4D),
                                        onPressed: () {},
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.visibility_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '25',
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Color(0xff242D4D),
                                      child: FlatButton(
                                        textColor: new Color(0xFF646E9F),
                                        height: 60.0,
                                        color: new Color(0xff242D4D),
                                        onPressed: () {},
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.star_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '5/5',
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                Expanded(
                                    child: RaisedButton(
                                      onPressed: () {},
                                      color: Color(0xff242D4D),
                                      child: FlatButton(
                                        textColor: new Color(0xFF646E9F),
                                        height: 60.0,
                                        color: new Color(0xff242D4D),
                                        onPressed: () {},
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.chat_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '3',
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ])
                      )
                    ],
                  )
              ),

            );
          },
          itemCount: _posterListe.length,
        ),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add_circle),
        backgroundColor: new Color(0xff242D4D),
        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>CreatePoster(_addNewPoster)));
        },
      ),

    );
  }


}



