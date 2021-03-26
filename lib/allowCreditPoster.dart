import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:rank_and_go/galleryPoster.dart';



class AllowCreditPoster extends StatefulWidget {
  @override
  _AllowCreditPosterState createState() => _AllowCreditPosterState();
}

class _AllowCreditPosterState extends State<AllowCreditPoster> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: new Color(0xff242D4D),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FluidSlider(
                value: _value,
                sliderColor: new Color(0xff3D4363),
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });

                },
                min: 0,
                max: 100,
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: Card(
                  color: new Color(0xff646E9F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        ' Vous avez 0 jeton(s)',
                        style: TextStyle(
                            color: new Color(0xff242D4D)
                        ),
                        textScaleFactor: 2,
                      ),
                      Icon((Icons.credit_card), color: new Color(0xff242D4D),size: 40,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: Card(
                  color: new Color(0xff646E9F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        ' Le poster a déjà 0 jeton',
                        style: TextStyle(
                            color: new Color(0xff242D4D)
                        ),
                        textScaleFactor: 2,
                      ),
                      Icon((Icons.credit_card), color: new Color(0xff242D4D),size: 40,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: new IconButton(
                            icon: Icon(Icons.keyboard_backspace_rounded, color: new Color(0xFF1DE4AE), size: 60), onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPoster()));
                        })),
                        Expanded(child: new IconButton(
                            icon: new Icon(CupertinoIcons.rocket_fill, color: new Color(0xFF1DE4AE), size: 60), onPressed: null)),

                      ]
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}