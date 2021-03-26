import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:rank_and_go/allowCreditPoster.dart';
import 'package:rank_and_go/models/media.dart';
import 'package:rank_and_go/models/poster.dart';
import 'package:rank_and_go/previsualisationPoster.dart';
import 'package:video_player/video_player.dart';

class CreatePoster extends StatefulWidget {
  final Function addPoster;

  CreatePoster(this.addPoster);

  @override
  _CreatePosterState createState() => _CreatePosterState();
}

class _CreatePosterState extends State<CreatePoster> {
  int idPoster = 1, idUser = 1, creditsAllow = 0;
  String title, desc;
  bool commentState = false;
  bool state = false;

  File selectedImage;
  File video;
  Media media1;
  Media media2;
  Media media3;

  final picker = ImagePicker();

  VideoPlayerController _videoPlayerController;

  Future _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    //final pickedVideo = await picker.getVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        return showDialog<void>(
          context: context,
          barrierDismissible: true, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: new Color(0xFF1EB88E),
              title: Text('Pas d\'image selectionnée !'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'Vous n\'avez pas selectionné d\'image :\'(',
                      style: TextStyle(color: new Color(0xff242D4D)),
                    ),
                    Text(
                      'Plus de crédits ? Allez en boutique pour en chopper un max !',
                      style: TextStyle(color: new Color(0xff242D4D)),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Ok capiche',
                    style: TextStyle(color: new Color(0xff242D4D)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  Future _pickImageFromCamera() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile.path);

    setState(() {
      selectedImage = image;
    });
  }

  Future _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  Future _pickVideoFromCamera() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.camera);

    video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  Poster posterVisu(){
    return new Poster(idPoster, desc, title, state, creditsAllow, commentState, idUser, TypeNote.oneToFive, media1, media2, media3);
  }

  Media mediaView(){
    if(selectedImage == null) {
      media1 =  new Media(video.path);
      return media1;
    }
    else{
      media1=  new Media(selectedImage.path);
      return media1;
    }
  }

  void submitData() {
    if(selectedImage == null){
      widget.addPoster(idPoster, desc, title, commentState, creditsAllow, idUser,
          state, video, media1, media2, media3);
    }
    else{
      widget.addPoster(idPoster, desc, title, commentState, creditsAllow, idUser,
          state, selectedImage, media1, media2, media3);
    }
  }

  void _showChoiceForMedia(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            child: Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 55.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: new Color(0xff242D4D), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _getImageFromGallery();
                          },
                          child:
                          Text("Sélectionner une image de votre galerie"),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: new Color(0xff242D4D), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _pickImageFromCamera();
                          },
                          child: Text("Prenez une photo directement !"),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: new Color(0xff242D4D), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _pickVideo();
                          },
                          child: Text(
                              "Sélectionnez une vidéo depuis votre galerie"),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: new Color(0xff242D4D), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _pickVideoFromCamera();
                          },
                          child: Text(
                              "Prenez une vidéo directement depuis votre caméra"),
                        ),
                      )
                    ],
                  ),
                )),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: new Color(0xff242D4D),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _showChoiceForMedia(context);
                },
                child: selectedImage != null || video != null
                    ? selectedImage != null
                    ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      selectedImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 150,
                    child: AspectRatio(
                      aspectRatio:
                      _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    ))
                    : Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 150,
                  decoration: BoxDecoration(
                    color: new Color(0xff242D4D),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 85,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                        decoration: InputDecoration(
                            hintText: "Titre",
                            hintStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          title = val;
                        }),
                    TextField(
                        decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: TextStyle(color: Colors.white)),
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          desc = val;
                        }),
                    DropdownButton<String>(
                      items: <String>['OneToFive', 'OneToTen', 'OneToTwenty']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                    CheckboxListTile(
                        title: Text(
                          'Ajouter commentaires',
                          style: TextStyle(color: Colors.white),
                        ),
                        value: commentState,
                        onChanged: (st) => setState(() => commentState = st)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: new IconButton(
                                  icon: Icon(Icons.remove_red_eye,
                                      color: new Color(0xFF1DE4AE), size: 60),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => previsualisationPoster(posterPrevisu: posterVisu(), mediaPrevisu: mediaView())));
                                  })),
                          Expanded(
                              child: new IconButton(
                                  icon: Icon(Icons.check_circle,
                                      color: new Color(0xFF1DE4AE), size: 60),
                                  onPressed: () {
                                    submitData();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AllowCreditPoster()));
                                  }))
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
