//Flutter
import 'package:flutter/material.dart';

//App
import 'package:rick_and_morty_app/widgets/search.dart';
import 'package:rick_and_morty_app/widgets/drawer_screen.dart';
import 'package:rick_and_morty_app/screens/characters/characters_screen.dart';

class Home extends StatelessWidget {
  static String id = 'Home';
  final page;

  Home({this.page});

  @override
  Widget build(BuildContext context) {
    print('home: build');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Search(),
        toolbarHeight: 120,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          DrawerScreen(
            size: size,
          ),
          page ??
              CharactersHome(
                size: size,
              ),
        ],
      ),
    );
  }
}
