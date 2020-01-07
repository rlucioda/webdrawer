import 'package:flutter/material.dart';
import 'package:web_drawer/routing/route_names.dart';
import 'package:web_drawer/widget/centered_view/centered_view.dart';

import 'drawer_item.dart';
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxShadow2 = [
      BoxShadow(color: Colors.black12, blurRadius: 16),
    ];
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        alignment: Alignment.topCenter,
        width: 300,
        decoration: BoxDecoration(
            //backgroundBlendMode: BlendMode.clear,
            color: Colors.black12,
            boxShadow: boxShadow2),
        child: CenteredView(
        child: Column(
          //Drawer(
          //child: ListView(
          //padding: EdgeInsets.zero,
          children: <Widget>[
            NavigationDrawerHeader(),
            // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
            // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
            DrawerItem("Início", Icons.home, HomeRoute),
            DrawerItem("Jobs", Icons.work, JobsRoute),
            DrawerItem("Clientes", Icons.person, ClientesRoute),
            DrawerItem("Sobre", Icons.help, AboutRoute),
          ],
        ),
        ),
        );
  }
}
