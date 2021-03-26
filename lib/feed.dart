import 'package:flutter/material.dart';
import './cards.dart';
import './matches.dart';
import './profiles.dart';

void main() => runApp(MyApp());

final MatchEngine matchEngine = new MatchEngine(
    matches: demoProfiles.map((Profile profile) {
  return Match(profile: profile);
}).toList());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Match match = new Match();

  Widget _buildBottomBar() {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.large(
                icon: "1",
                iconColor: Colors.white,
                onPressed: () {
                  matchEngine.currentMatch.nope();
                },
              ),
              new RoundIconButton.large(
                icon: "2",
                iconColor: Colors.white,
                onPressed: () {
                  matchEngine.currentMatch.nope();
                },
              ),
              new RoundIconButton.large(
                icon: "3",
                iconColor: Colors.white,
                onPressed: () {
                  matchEngine.currentMatch.superLike();
                },
              ),
              new RoundIconButton.large(
                icon: "4",
                iconColor: Colors.white,
                onPressed: () {
                  matchEngine.currentMatch.like();
                },
              ),
              new RoundIconButton.large(
                icon: "5",
                iconColor: Colors.white,
                onPressed: () {
                  matchEngine.currentMatch.like();
                },
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      backgroundColor: const Color(0xff242D4D),
      body: new Padding(
        padding: EdgeInsets.only(bottom: 70.0),
        child: CardStack(
          matchEngine: matchEngine,
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: new Color(0xff1DE4AE),
          boxShadow: [
            new BoxShadow(color: const Color(0x00000000), blurRadius: 10.0),
          ]),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Text(
          this.icon,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
