import 'package:flutter/material.dart';
import 'package:web_drawer/views/home/home_view.dart';
import 'package:web_drawer/views/layout_template/layout_template.dart';
import 'package:web_drawer/views/login/login.dart';

import 'constants/app_colors.dart';
import 'constants/text_theme.dart';
import 'locator.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Jobs',
      debugShowCheckedModeBanner: false,
      theme: buildRallyTheme(),
      home: LayoutTemplate(),
      initialRoute: '/login',
      routes: {'/login': (context) => LoginPage()},
      );
  }
}