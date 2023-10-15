import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkThemeMode = ThemeData.dark().copyWith(
      pageTransitionsTheme: _pageTransitionsTheme(),
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        titleSpacing: 100,
        toolbarTextStyle: TextStyle(color: Colors.white),
        elevation: 0.0,
        toolbarHeight: 80,
        titleTextStyle: TextStyle(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      textTheme: const TextTheme(
        subtitle1:
            TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(
            color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w300),
      ));

  static PageTransitionsTheme _pageTransitionsTheme() {
    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    );
  }
}
