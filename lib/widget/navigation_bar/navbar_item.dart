import 'package:flutter/material.dart';
import 'package:web_drawer/locator.dart';
import 'package:web_drawer/services/navigation_service.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        //print("Navigation Path $navigationPath");
        locator<NavigationService>().navigateTo(navigationPath);
        Navigator.pop(context);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}