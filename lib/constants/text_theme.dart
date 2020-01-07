import 'package:flutter/material.dart';

import 'app_colors.dart';

class RallyTextTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

ThemeData buildRallyTheme() {
	final ThemeData base = ThemeData.dark();
	return ThemeData(
		scaffoldBackgroundColor: RallyColors.primaryBackground,
		primaryColor: RallyColors.primaryBackground,
		textTheme: buildRallyTextTheme(base.textTheme),
		inputDecorationTheme: InputDecorationTheme(
			labelStyle:
			TextStyle(color: RallyColors.gray, fontWeight: FontWeight.w500),
			filled: true,
			fillColor: RallyColors.inputBackground,
			focusedBorder: InputBorder.none,
		),
	);
}

TextTheme buildRallyTextTheme(TextTheme base) {
	return base
			.copyWith(
		body1: base.body1.copyWith(
			fontFamily: 'Roboto Condensed',
			fontSize: 14,
			fontWeight: FontWeight.w400,
		),
		body2: base.body2.copyWith(
			fontFamily: 'Eczar',
			fontSize: 40,
			fontWeight: FontWeight.w400,
			letterSpacing: 1.4,
		),
		button: base.button.copyWith(
			fontFamily: 'Roboto Condensed',
			fontWeight: FontWeight.w700,
			letterSpacing: 2.8,
		),
		headline: base.body2.copyWith(
			fontFamily: 'Eczar',
			fontSize: 40,
			fontWeight: FontWeight.w600,
			letterSpacing: 1.4,
		),
	)
			.apply(
		displayColor: Colors.white,
		bodyColor: Colors.white,
	);
}