import 'package:flutter/material.dart';
import 'package:web_drawer/constants/app_colors.dart';
import 'package:web_drawer/widget/centered_view/centered_view.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: primaryColor,
      alignment: Alignment.center,
      child: CenteredView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("MENU", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white ), )
        ],
      ),
      ),
/*
          child: DrawerHeader(
            padding: EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(color: Colors.orange, child: FlutterLogo(size: 60.0,),),
                Expanded (child:
                Container(color: Colors.white12, child: Center(child: Text("Menu:")),),
                )
            ]
            ),
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
          ),
*/
    );
  }
}
/**
 *
 *       color: Colors.blueGrey,
      height: 150,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
 */
