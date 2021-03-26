import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import './feed.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TabBar Inside AppBar Demo",
      home: TabBarInsideAppBarDemo(),
    ));

class TabBarInsideAppBarDemo extends StatefulWidget {
  @override
  _TabBarInsideAppBarDemoState createState() => _TabBarInsideAppBarDemoState();
}

class _TabBarInsideAppBarDemoState extends State<TabBarInsideAppBarDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
  }

  int _counter = 10;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget getTabBar() {
    return TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: MaterialIndicator(
          color: Colors.white,
          height: 5,
          topLeftRadius: 0,
          topRightRadius: 0,
          bottomLeftRadius: 5,
          bottomRightRadius: 5,
          tabPosition: TabPosition.top,
        ),
        tabs: [
          Tab(icon: Icon(Icons.settings_rounded, color: Colors.white)),
          Tab(icon: Icon(Icons.account_circle_rounded, color: Colors.white)),
          Tab(text: "           "),
          Tab(icon: Icon(Icons.burst_mode_rounded, color: Colors.white)),
          Tab(icon: Icon(Icons.star_half_rounded, color: Colors.white)),
        ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      Container(color: Colors.white),
      Container(color: Colors.blueAccent),
      Container(color: Colors.green),
      Container(color: Colors.red),
      MyApp()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Container(
            height: 30.0,
            width: 70.0,
            color: Colors.transparent,
            child: new Container(
                padding: const EdgeInsets.only(left: 8.0, right: 3.0),
                decoration: new BoxDecoration(
                    color: new Color(0xff1DE4AE),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                      bottomLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    )),
                child: new Center(
                  child: Row(children: <Widget>[
                    Expanded(child: new Text('$_counter')),
                    Expanded(
                        child: Icon(Icons.loop_rounded, color: Colors.white))
                  ]),
                )),
          ),
          backgroundColor: const Color(0xff242D4D),
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        ),
        body: getTabBarPages());
  }
}
