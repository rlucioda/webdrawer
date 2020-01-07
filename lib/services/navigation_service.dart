import 'dart:js';

import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    print("Route Name $routeName");
    print("Navigator Key: ${navigatorKey}");

    NavigatorState navState = navigatorKey.currentState;

    print("Print NavState: $navState");

    return navState.popAndPushNamed(routeName);  //pushNamed(routeName);
  }

  bool goBack(){
    return navigatorKey.currentState.pop();
  }
}