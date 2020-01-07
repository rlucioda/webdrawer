import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_drawer/widget/nav_drawer/navigation_drawer.dart';

import 'home_content_desktop.dart';
import 'home_content_mobile.dart';

class HomeView extends StatefulWidget {
//  final String title;
  
//  const HomeView(String s, {Key key, this.title}) : super(key: key);
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      desktop: HomeContentDesktop(),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
      drawer: new NavigationDrawer(),
      appBar: AppBar(
        title: Text("App BAT Text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    ),
    );
  }
  */
}
