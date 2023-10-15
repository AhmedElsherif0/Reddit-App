import 'package:flutter/material.dart';
import 'package:reddit_app/presentation/screens/main_screen.dart';
import 'package:reddit_app/presentation/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const MainScreen(),
    );
  }
}
