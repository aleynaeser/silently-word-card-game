import 'package:card_game/screens/intro_page_view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliently | Funny Card Game',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
        scaffoldBackgroundColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: IntroPageView(),
    );
  }
}