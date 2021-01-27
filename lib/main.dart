//Flutter
import 'package:flutter/material.dart';

//App routes
import 'package:rick_and_morty_app/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty App',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Home(),
    );
  }
}
